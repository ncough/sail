#!/usr/bin/env python3
"""
Generate SMT constraints from ASL instruction blocks using Z3.
Converts __opcode patterns and __guard expressions to SMT constraints.
"""

import re
from typing import List, Dict, Tuple, Optional, Set, Union
from z3 import *
from dataclasses import dataclass

# AST nodes for guard expressions
@dataclass
class GuardExpr:
    """Base class for guard expressions"""
    pass

@dataclass
class BoolLiteral(GuardExpr):
    value: bool

@dataclass
class IntLiteral(GuardExpr):
    value: int

@dataclass
class BitsLiteral(GuardExpr):
    value: str  # Binary string like '0110'

@dataclass
class Identifier(GuardExpr):
    name: str

@dataclass
class FunctionCall(GuardExpr):
    name: str
    args: List[GuardExpr]

@dataclass
class BinaryOp(GuardExpr):
    left: GuardExpr
    op: str
    right: GuardExpr

@dataclass
class UnaryOp(GuardExpr):
    op: str
    operand: GuardExpr

class GuardParser:
    """Parser for ASL guard expressions"""
    
    def __init__(self, text: str):
        self.text = text
        self.pos = 0
        self.tokens = self._tokenize()
        self.current_token = 0
    
    def _tokenize(self) -> List[Tuple[str, str]]:
        """Tokenize the guard expression"""
        patterns = [
            ('WHITESPACE', r'\s+'),
            ('BITS_LITERAL', r"'[01x]+'"),
            ('INT_LITERAL', r'\d+'),
            ('IDENTIFIER', r'[a-zA-Z_][a-zA-Z0-9_]*'),
            ('LPAREN', r'\('),
            ('RPAREN', r'\)'),
            ('COMMA', r','),
            ('NEQ', r'!='),
            ('EQ', r'=='),
            ('GTE', r'>='),
            ('LTE', r'<='),
            ('GT', r'>'),
            ('LT', r'<'),
            ('COLON', r':'),
            ('PLUS', r'\+'),
            ('MINUS', r'-'),
            ('UNKNOWN', r'.')
        ]
        
        tokens = []
        pos = 0
        while pos < len(self.text):
            matched = False
            for pattern_name, pattern in patterns:
                regex = re.compile(pattern)
                match = regex.match(self.text, pos)
                if match:
                    value = match.group()
                    if pattern_name != 'WHITESPACE':
                        tokens.append((pattern_name, value))
                    pos = match.end()
                    matched = True
                    break
            if not matched:
                pos += 1
        
        return tokens
    
    def _peek(self) -> Optional[Tuple[str, str]]:
        """Peek at current token without consuming it"""
        if self.current_token < len(self.tokens):
            return self.tokens[self.current_token]
        return None
    
    def _consume(self, expected_type: str = None) -> Tuple[str, str]:
        """Consume and return current token"""
        if self.current_token >= len(self.tokens):
            raise ValueError("Unexpected end of input")
        
        token = self.tokens[self.current_token]
        self.current_token += 1
        
        if expected_type and token[0] != expected_type:
            raise ValueError(f"Expected {expected_type}, got {token[0]}")
        
        return token
    
    def parse(self) -> GuardExpr:
        """Parse the guard expression"""
        expr = self._parse_expression()
        if self.current_token < len(self.tokens):
            raise ValueError(f"Unexpected token: {self.tokens[self.current_token]}")
        return expr
    
    def _parse_expression(self) -> GuardExpr:
        """Parse any expression"""
        return self._parse_concatenation()
    
    def _parse_concatenation(self) -> GuardExpr:
        """Parse concatenation expressions (infix :)"""
        left = self._parse_comparison()
        
        while self._peek() and self._peek()[0] == 'COLON':
            self._consume('COLON')
            right = self._parse_comparison()
            left = BinaryOp(left, ':', right)
        
        return left
    
    def _parse_comparison(self) -> GuardExpr:
        """Parse comparison expressions (==, !=, <, >, <=, >=)"""
        left = self._parse_primary()
        
        token = self._peek()
        if token and token[0] in ['EQ', 'NEQ', 'LT', 'GT', 'LTE', 'GTE']:
            op_token = self._consume()
            right = self._parse_primary()
            return BinaryOp(left, op_token[1], right)
        
        return left
    
    def _parse_primary(self) -> GuardExpr:
        """Parse primary expressions"""
        token = self._peek()
        
        if not token:
            raise ValueError("Unexpected end of input")
        
        if token[0] == 'IDENTIFIER':
            name = self._consume('IDENTIFIER')[1]
            
            # Check for function call
            if self._peek() and self._peek()[0] == 'LPAREN':
                self._consume('LPAREN')
                args = []
                
                # Parse arguments
                if self._peek() and self._peek()[0] != 'RPAREN':
                    args.append(self._parse_expression())
                    
                    while self._peek() and self._peek()[0] == 'COMMA':
                        self._consume('COMMA')
                        args.append(self._parse_expression())
                
                self._consume('RPAREN')
                return FunctionCall(name, args)
            else:
                return Identifier(name)
        
        elif token[0] == 'INT_LITERAL':
            value = int(self._consume('INT_LITERAL')[1])
            return IntLiteral(value)
        
        elif token[0] == 'BITS_LITERAL':
            value = self._consume('BITS_LITERAL')[1]
            # Remove quotes
            value = value[1:-1]
            return BitsLiteral(value)
        
        elif token[0] == 'LPAREN':
            self._consume('LPAREN')
            expr = self._parse_expression()
            self._consume('RPAREN')
            return expr
        
        else:
            raise ValueError(f"Unexpected token: {token}")

class SMTConstraintGenerator:
    def __init__(self, verbose=False):
        self.solver = Solver()
        # 32-bit opcode bitvector
        self.opcode = BitVec('opcode', 32)
        # Backwards matches function cache
        self.backwards_matches_cache = {}
        # Configuration
        self.sew_value = 32  # SEW (Selected Element Width) - can be changed to 64
        self.verbose = verbose  # Enable verbose SMT query printing
        
    def parse_instruction_blocks(self, file_path: str) -> List[Dict]:
        """Parse instruction blocks from the ASL file."""
        with open(file_path, 'r') as f:
            content = f.read()
        
        # Find all instruction blocks
        instruction_pattern = r'__instruction\s+(\w+)\s*\n(.*?)(?=\n__instruction|\Z)'
        instructions = []
        
        for match in re.finditer(instruction_pattern, content, re.DOTALL):
            instr_name = match.group(1)
            instr_content = match.group(2)
            
            # Parse encoding block
            encoding_match = re.search(r'__encoding\s+(\w+)', instr_content)
            if not encoding_match:
                continue
            
            encoding_name = encoding_match.group(1)
            
            # Parse fields with their bit ranges
            field_pattern = r'__field\s+(\w+)\s+(\d+)\s+\+:\s+(\d+)'
            fields = []
            for field_match in re.finditer(field_pattern, instr_content):
                field_name = field_match.group(1)
                start_bit = int(field_match.group(2))
                width = int(field_match.group(3))
                fields.append((field_name, start_bit, width))
            
            # Parse opcode pattern
            opcode_match = re.search(r'__opcode\s+\'([^\']+)\'', instr_content)
            opcode_pattern = opcode_match.group(1) if opcode_match else ""
            
            # Parse guard
            guard_match = re.search(r'__guard\s+(.+)', instr_content)
            guard = guard_match.group(1).strip() if guard_match else ""
            
            instructions.append({
                'name': instr_name,
                'encoding': encoding_name,
                'fields': fields,
                'opcode_pattern': opcode_pattern,
                'guard': guard
            })
        
        return instructions
    
    def parse_backwards_matches_functions(self, file_path: str) -> Dict[str, List[str]]:
        """Parse backwards_matches functions and extract their bit patterns."""
        with open(file_path, 'r') as f:
            content = f.read()
        
        functions = {}
        
        # Find all backwards_matches and forwards_matches function definitions
        pattern = r'boolean\s+(\w+(?:backwards|forwards)_matches)\([^)]+\)(.*?)(?=\n\n|\nboolean|\n[a-zA-Z].*\(|\Z)'
        
        for match in re.finditer(pattern, content, re.DOTALL):
            func_name = match.group(1)
            func_body = match.group(2)
            
            # Check if it just returns TRUE
            if re.search(r'return\s+TRUE', func_body):
                functions[func_name] = []
                continue
            
            # Extract all eq_bits literals from the function body
            eq_bits_pattern = r"eq_bits\([^,]+,\s*'([^']+)'\)"
            literals = re.findall(eq_bits_pattern, func_body)
            
            functions[func_name] = literals
        
        return functions
    
    def opcode_pattern_to_smt(self, pattern: str) -> BoolRef:
        """Convert an opcode pattern (like 'xx10101xxxxxxxxxx000xxxxx0110011') to SMT constraint."""
        if not pattern:
            return BoolVal(True)
        
        constraints = []
        
        # Pattern is 32 bits, MSB first
        for i, bit_char in enumerate(pattern):
            bit_pos = 31 - i  # Convert to LSB indexing
            
            if bit_char == '0':
                # Bit must be 0
                constraints.append(Extract(bit_pos, bit_pos, self.opcode) == BitVecVal(0, 1))
            elif bit_char == '1':
                # Bit must be 1
                constraints.append(Extract(bit_pos, bit_pos, self.opcode) == BitVecVal(1, 1))
            elif bit_char == 'x':
                # Don't care bit
                pass
            else:
                raise ValueError(f"Invalid bit character '{bit_char}' in opcode pattern")
        
        return And(constraints) if constraints else BoolVal(True)
    
    def extract_field_from_opcode(self, field_name: str, start_bit: int, width: int, 
                                  instruction_name: str = None) -> BitVecRef:
        """Extract a field from the opcode as a bitvector expression."""
        # Extract bits from opcode (start_bit is the LSB)
        end_bit = start_bit + width - 1
        extracted = Extract(end_bit, start_bit, self.opcode)
        
        return extracted
    
    def backwards_matches_to_smt(self, func_name: str, field_ref: BitVecRef, 
                                 backwards_matches: Dict[str, List[str]]) -> BoolRef:
        """Convert a backwards_matches function call to SMT constraint."""
        if func_name not in backwards_matches:
            # If function not found, assume it always matches
            return BoolVal(True)
        
        literals = backwards_matches[func_name]
        
        if not literals:
            # Function returns TRUE
            return BoolVal(True)
        
        # Create OR constraint for all valid literals
        constraints = []
        field_width = field_ref.size()  # Get the width of the field
        
        for literal in literals:
            # Convert binary literal to bitvector value
            literal_width = len(literal)
            bit_val = int(literal, 2)
            
            # Ensure the literal has the same width as the field
            if literal_width == field_width:
                constraints.append(field_ref == BitVecVal(bit_val, field_width))
            elif literal_width < field_width:
                # Zero-extend the literal to match field width
                constraints.append(field_ref == BitVecVal(bit_val, field_width))
            else:
                # Literal is wider than field - this shouldn't happen in well-formed ASL
                raise ValueError(f"Literal '{literal}' ({literal_width} bits) is wider than field ({field_width} bits)")
        
        return Or(constraints) if constraints else BoolVal(True)
    
    def verbose_check_sat(self, solver: Solver, context: str = "") -> CheckSatResult:
        """Check satisfiability with verbose output if enabled (only on sat results)."""
        result = solver.check()
        
        if self.verbose and result == sat:
            print(f"\n=== SMT QUERY {context} ===")
            print("(declare-fun opcode () (_ BitVec 32))")
            for assertion in solver.assertions():
                print(f"(assert {assertion})")
            print("(check-sat)")
            print("=== QUERY END ===\n")
            print(f"Result: {result}")
            model = solver.model()
            print("Model:")
            for decl in sorted(model.decls(), key=lambda x: str(x)):
                print(f"  {decl}: {model[decl]}")
            print()
        
        return result
    
    def validate_guard_expression(self, guard_ast: GuardExpr) -> None:
        """Validate that guard expression only uses allowed constructs."""
        allowed_functions = {
            'and_bool', 'or_bool', 'eq_int', 'neq_int', 'lt_int', 'gt_int', 
            'lteq_int', 'gteq_int', 'currentlyEnabled', 'eq_bit', 'neq_bits',
            'ult_bits', 'ugt_bits', 'uleq_bits', 'ugeq_bits', 'eq_bits',
            'in32BitMode', 'haveHalfFPU', 'haveSingleFPU', 'haveDoubleFPU',
            'virtual_memory_supported', 'bitvector_access', 'get_sew', 'haveHalfMin',
            'zvk_check_encdec', 'zvk_valid_reg_overlap', 'get_lmul_pow',
            'validDoubleRegs', 'amo_width_valid', 'zvknhab_check_encdec', 
            'lrsc_width_valid', 'valid_load_encdec', 'size_bytes_forwards',
            'encdec_nreg_forwards_matches', 'not', 'encdec_vreg_backwards'
        }
        
        # Functions that will be replaced with constants (don't need to validate their arguments)
        constant_replacement_functions = {
            'currentlyEnabled', 'in32BitMode', 'haveHalfFPU', 'haveSingleFPU', 'haveDoubleFPU',
            'virtual_memory_supported', 'haveHalfMin', 'validDoubleRegs', 'amo_width_valid', 
            'zvk_check_encdec', 'zvknhab_check_encdec', 'lrsc_width_valid', 'valid_load_encdec', 
            'size_bytes_forwards', 'get_sew', 'zvk_valid_reg_overlap'
        }
        
        def validate_node(node: GuardExpr):
            if isinstance(node, FunctionCall):
                if node.name.endswith('backwards_matches') or node.name.endswith('forwards_matches'):
                    # These are handled separately
                    pass
                elif node.name not in allowed_functions:
                    raise ValueError(f"Unsupported function call '{node.name}' in guard expression")
                
                # Only validate arguments for functions that aren't replaced with constants
                if node.name not in constant_replacement_functions:
                    for arg in node.args:
                        validate_node(arg)
            
            elif isinstance(node, BinaryOp):
                validate_node(node.left)
                validate_node(node.right)
            
            elif isinstance(node, UnaryOp):
                validate_node(node.operand)
            
            elif isinstance(node, Identifier):
                # Only allow xlen, xlen_bytes and field names
                if node.name not in ['xlen', 'xlen_bytes', 'TRUE', 'FALSE']:
                    # Will be validated against field names later
                    pass
        
        validate_node(guard_ast)
    
    def parse_guard_expression(self, guard: str, instruction: Dict, 
                               backwards_matches: Dict[str, List[str]]) -> BoolRef:
        """Parse and convert guard expression to SMT constraint."""
        if not guard or guard.strip() == '':
            return BoolVal(True)
        
        # Handle simple cases first
        if guard.strip() == 'TRUE':
            return BoolVal(True)
        if guard.strip() == 'FALSE':
            return BoolVal(False)
        
        # Preprocess zreg comparisons
        # Replace 'encdec_reg_backwards(field) != zreg' with 'field != '00000''
        field_dict = {name: (start, width) for name, start, width in instruction['fields']}
        for field_name in field_dict:
            pattern = rf'encdec_reg_backwards\({field_name}\)\s*!=\s*zreg'
            replacement = f"{field_name} != '00000'"
            guard = re.sub(pattern, replacement, guard)
        
        # Preprocess specific encdec_backwards comparisons
        # Replace 'encdec_vaesdf_backwards(funct6) == ZVK_VAESDF_VV' with 'funct6 == '101000''
        for field_name in field_dict:
            # Handle various encdec_*_backwards function comparisons with constants
            patterns = [
                (rf'encdec_vaesdf_backwards\({field_name}\)\s*==\s*ZVK_VAESDF_VV', f"{field_name} == '101000'"),
                (rf'encdec_vaesdm_backwards\({field_name}\)\s*==\s*ZVK_VAESDM_VV', f"{field_name} == '101001'"),
                (rf'encdec_vaesef_backwards\({field_name}\)\s*==\s*ZVK_VAESEF_VV', f"{field_name} == '101010'"),
                (rf'encdec_vaesem_backwards\({field_name}\)\s*==\s*ZVK_VAESEM_VV', f"{field_name} == '101011'"),
            ]
            for pattern, replacement in patterns:
                guard = re.sub(pattern, replacement, guard)
        
        # Replace specific SEW comparisons
        # Replace 'eq_int(get_sew(), 64)' with 'TRUE'
        guard = re.sub(r'eq_int\(get_sew\(\),\s*64\)', 'TRUE', guard)
        
        # Parse the guard expression into AST
        try:
            parser = GuardParser(guard)
            guard_ast = parser.parse()
        except Exception as e:
            raise ValueError(f"Failed to parse guard expression '{guard}': {e}")
        
        # Validate the AST
        self.validate_guard_expression(guard_ast)
        
        # Convert AST to SMT
        field_dict = {name: (start, width) for name, start, width in instruction['fields']}
        return self.guard_ast_to_smt(guard_ast, field_dict, backwards_matches)
    
    def guard_ast_to_smt(self, node: GuardExpr, field_dict: Dict[str, Tuple[int, int]], 
                         backwards_matches: Dict[str, List[str]]) -> BoolRef:
        """Convert guard AST to SMT constraint."""
        
        if isinstance(node, BoolLiteral):
            return BoolVal(node.value)
        
        elif isinstance(node, IntLiteral):
            return IntVal(node.value)
        
        elif isinstance(node, BitsLiteral):
            # Convert binary string to integer
            bit_val = int(node.value, 2)
            bit_width = len(node.value)
            return BitVecVal(bit_val, bit_width)
        
        elif isinstance(node, Identifier):
            if node.name == 'TRUE':
                return BoolVal(True)
            elif node.name == 'FALSE':
                return BoolVal(False)
            elif node.name == 'xlen':
                return IntVal(64)  # Assume xlen is 64 as requested
            elif node.name == 'xlen_bytes':
                return IntVal(8)  # xlen_bytes = xlen / 8 = 64 / 8 = 8
            elif node.name in field_dict:
                start_bit, width = field_dict[node.name]
                return self.extract_field_from_opcode(node.name, start_bit, width, 
                                                      getattr(self, '_current_instruction_name', None))
            else:
                raise ValueError(f"Unknown identifier '{node.name}'")
        
        elif isinstance(node, FunctionCall):
            if node.name == 'currentlyEnabled':
                # Assume currentlyEnabled is always true as requested
                return BoolVal(True)
            
            elif node.name == 'in32BitMode':
                # Replace with false as requested
                return BoolVal(False)
            
            elif node.name in ['haveHalfFPU', 'haveSingleFPU', 'haveDoubleFPU', 'virtual_memory_supported', 
                               'haveHalfMin', 'validDoubleRegs', 'amo_width_valid', 'zvk_check_encdec', 
                               'zvknhab_check_encdec', 'lrsc_width_valid', 'valid_load_encdec', 'size_bytes_forwards',
                               'zvk_valid_reg_overlap']:
                # Replace with true as requested
                return BoolVal(True)
            
            elif node.name == 'get_sew':
                # Replace with configurable SEW value (default 32)
                return IntVal(self.sew_value)
            
            elif node.name == 'bitvector_access':
                # Extract single bit: bitvector_access(bitvec, index)
                if len(node.args) == 2:
                    bitvec_expr = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    index_expr = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    
                    # Convert index to int if it's a constant
                    if is_int_value(index_expr):
                        bit_index = index_expr.as_long()
                        return Extract(bit_index, bit_index, bitvec_expr)
                    else:
                        # For dynamic indices, we'd need more complex handling
                        # For now, assume static indices
                        raise ValueError("Dynamic bitvector_access indices not supported yet")
                else:
                    raise ValueError(f"bitvector_access expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'not':
                # Boolean not operation
                if len(node.args) == 1:
                    operand = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    return Not(operand)
                else:
                    raise ValueError(f"not expects 1 argument, got {len(node.args)}")
            
            elif node.name == 'encdec_vreg_backwards':
                # Passthrough function - just return its argument
                if len(node.args) == 1:
                    return self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                else:
                    raise ValueError(f"encdec_vreg_backwards expects 1 argument, got {len(node.args)}")
            
            elif node.name == 'and_bool':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return And(left, right)
                else:
                    raise ValueError(f"and_bool expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'or_bool':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return Or(left, right)
                else:
                    raise ValueError(f"or_bool expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'eq_int':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return left == right
                else:
                    raise ValueError(f"eq_int expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'neq_int':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return left != right
                else:
                    raise ValueError(f"neq_int expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'lt_int':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return left < right
                else:
                    raise ValueError(f"lt_int expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'lteq_int':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return left <= right
                else:
                    raise ValueError(f"lteq_int expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'gt_int':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return left > right
                else:
                    raise ValueError(f"gt_int expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'gteq_int':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return left >= right
                else:
                    raise ValueError(f"gteq_int expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'eq_bit':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return left == right
                else:
                    raise ValueError(f"eq_bit expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'eq_bits':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return left == right
                else:
                    raise ValueError(f"eq_bits expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'neq_bits':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return left != right
                else:
                    raise ValueError(f"neq_bits expects 2 arguments, got {len(node.args)}")
            
            elif node.name == 'ult_bits':
                if len(node.args) == 2:
                    left = self.guard_ast_to_smt(node.args[0], field_dict, backwards_matches)
                    right = self.guard_ast_to_smt(node.args[1], field_dict, backwards_matches)
                    return ULT(left, right)
                else:
                    raise ValueError(f"ult_bits expects 2 arguments, got {len(node.args)}")
            
            elif node.name.endswith('backwards_matches') or node.name.endswith('forwards_matches'):
                # Handle backwards_matches and forwards_matches function calls
                if len(node.args) == 1:
                    arg = node.args[0]
                    if isinstance(arg, Identifier) and arg.name in field_dict:
                        start_bit, width = field_dict[arg.name]
                        field_ref = self.extract_field_from_opcode(arg.name, start_bit, width,
                                                                   getattr(self, '_current_instruction_name', None))
                        return self.backwards_matches_to_smt(node.name, field_ref, backwards_matches)
                    else:
                        raise ValueError(f"matches function expects field identifier, got {arg}")
                else:
                    raise ValueError(f"matches function expects 1 argument, got {len(node.args)}")
            
            else:
                raise ValueError(f"Unsupported function call '{node.name}'")
        
        elif isinstance(node, BinaryOp):
            left = self.guard_ast_to_smt(node.left, field_dict, backwards_matches)
            right = self.guard_ast_to_smt(node.right, field_dict, backwards_matches)
            
            if node.op == '==':
                return left == right
            elif node.op == '!=':
                return left != right
            elif node.op == '<':
                return left < right
            elif node.op == '<=':
                return left <= right
            elif node.op == '>':
                return left > right
            elif node.op == '>=':
                return left >= right
            elif node.op == 'and_bool':
                return And(left, right)
            elif node.op == 'or_bool':
                return Or(left, right)
            elif node.op == ':':
                # Bitvector concatenation
                return Concat(left, right)
            else:
                raise ValueError(f"Unsupported binary operator '{node.op}'")
        
        elif isinstance(node, UnaryOp):
            operand = self.guard_ast_to_smt(node.operand, field_dict, backwards_matches)
            
            if node.op == 'not':
                return Not(operand)
            else:
                raise ValueError(f"Unsupported unary operator '{node.op}'")
        
        else:
            raise ValueError(f"Unsupported AST node type: {type(node)}")
    
    def generate_constraint_for_instruction(self, instruction: Dict, 
                                            backwards_matches: Dict[str, List[str]]) -> BoolRef:
        """Generate SMT constraint for a single instruction."""
        constraints = []
        
        # Set current instruction name for field disambiguation
        self._current_instruction_name = instruction['encoding']
        
        # Add opcode pattern constraint
        opcode_constraint = self.opcode_pattern_to_smt(instruction['opcode_pattern'])
        constraints.append(opcode_constraint)
        
        # Add guard constraint
        guard_constraint = self.parse_guard_expression(instruction['guard'], instruction, backwards_matches)
        constraints.append(guard_constraint)
        
        # Fields are now extracted on-demand in guard expressions
        
        return And(constraints)
    
    def analyze_instruction_satisfiability(self, instructions_file: str, support_file: str) -> None:
        """Find all instructions that cannot be satisfied."""
        print("=== UNSATISFIABLE INSTRUCTIONS ===")
        
        # Parse instruction blocks and backwards_matches functions
        instructions = self.parse_instruction_blocks(instructions_file)
        backwards_matches = self.parse_backwards_matches_functions(support_file)
        
        unsatisfiable_instructions = []
        
        for instruction in instructions:
            # Create a new solver for each instruction to avoid interference
            temp_solver = Solver()
            temp_opcode = BitVec('opcode', 32)
            
            # Temporarily override instance variables for this instruction
            original_solver = self.solver
            original_opcode = self.opcode
            
            self.solver = temp_solver
            self.opcode = temp_opcode
            
            try:
                constraint = self.generate_constraint_for_instruction(instruction, backwards_matches)
                temp_solver.add(constraint)
                
                result = self.verbose_check_sat(temp_solver, f"Satisfiability check for {instruction['encoding']}")
                if result == unsat:
                    unsatisfiable_instructions.append(instruction['encoding'])
                    print(f"UNSAT: {instruction['encoding']}")
                
            except Exception as e:
                print(f"ERROR analyzing {instruction['encoding']}: {e}")
            finally:
                # Restore original instance variables
                self.solver = original_solver
                self.opcode = original_opcode
        
        print(f"\nFound {len(unsatisfiable_instructions)} unsatisfiable instructions out of {len(instructions)}")
        return unsatisfiable_instructions
    
    def find_all_collision_pairs(self, current_instruction: Dict, previous_instructions: List[Dict], 
                                backwards_matches: Dict[str, List[str]]) -> List[str]:
        """Find all previous instructions that collide with the current instruction."""
        current_name = current_instruction['encoding']
        colliding_instructions = []
        
        # Test against each previous instruction using shared opcode and field extraction
        for prev_instruction in previous_instructions:
            prev_name = prev_instruction['encoding']
            
            try:
                # Create fresh solver with shared opcode for both instructions
                collision_solver = Solver()
                shared_opcode = BitVec('opcode', 32)
                
                # Generate constraints for both instructions using the SAME opcode variable
                # and ensuring field extraction is consistent
                
                # Save original state
                original_solver = self.solver
                original_opcode = self.opcode
                
                # Set up for current instruction - use generic field names for collision detection
                self.solver = collision_solver
                self.opcode = shared_opcode
                
                # Temporarily disable instruction-specific field naming for collision detection
                self._current_instruction_name = None
                current_constraint = self.generate_constraint_for_instruction(current_instruction, backwards_matches)
                collision_solver.add(current_constraint)
                
                # Field extractions are now done on-demand in guard expressions
                # Generate constraint for previous instruction with the same opcode
                self._current_instruction_name = None
                prev_constraint = self.generate_constraint_for_instruction(prev_instruction, backwards_matches)
                collision_solver.add(prev_constraint)
                
                # Both constraints are now added to the same solver with shared opcode
                result = self.verbose_check_sat(collision_solver, f"Collision check: {current_name} vs {prev_name}")
                if result == sat:
                    # Found a real collision!
                    model = collision_solver.model()
                    opcode_val = model.evaluate(shared_opcode)
                    print(f"COLLISION FOUND: {current_name} collides with {prev_name}")
                    try:
                        opcode_int = opcode_val.as_long()
                        print(f"Conflicting opcode: {opcode_val} (0x{opcode_int:08x})")
                    except:
                        print(f"Conflicting opcode: {opcode_val}")
                    
                    colliding_instructions.append(prev_name)
                
                # Restore state for next iteration
                self.solver = original_solver
                self.opcode = original_opcode
                    
            except Exception as e:
                print(f"ERROR testing collision between {current_name} and {prev_name}: {e}")
                # Restore state on error
                self.solver = original_solver
                self.opcode = original_opcode
                continue
        
        return colliding_instructions
    
    def find_collision_pair(self, current_instruction: Dict, previous_instructions: List[Dict], 
                            backwards_matches: Dict[str, List[str]]) -> Optional[str]:
        """Find which specific previous instruction collides with the current instruction."""
        current_name = current_instruction['encoding']
        
        # Test against each previous instruction using shared opcode and field extraction
        for prev_instruction in previous_instructions:
            prev_name = prev_instruction['encoding']
            
            try:
                # Create fresh solver with shared opcode for both instructions
                collision_solver = Solver()
                shared_opcode = BitVec('opcode', 32)
                
                # Generate constraints for both instructions using the SAME opcode variable
                # and ensuring field extraction is consistent
                
                # Save original state
                original_solver = self.solver
                original_opcode = self.opcode
                
                # Set up for current instruction - use generic field names for collision detection
                self.solver = collision_solver
                self.opcode = shared_opcode
                
                # Temporarily disable instruction-specific field naming for collision detection
                self._current_instruction_name = None
                current_constraint = self.generate_constraint_for_instruction(current_instruction, backwards_matches)
                collision_solver.add(current_constraint)
                
                # Field extractions are now done on-demand in guard expressions
                # Generate constraint for previous instruction with the same opcode
                self._current_instruction_name = None
                prev_constraint = self.generate_constraint_for_instruction(prev_instruction, backwards_matches)
                collision_solver.add(prev_constraint)
                
                # Both constraints are now added to the same solver with shared opcode
                result = self.verbose_check_sat(collision_solver, f"Collision check: {current_name} vs {prev_name}")
                if result == sat:
                    # Found a real collision!
                    model = collision_solver.model()
                    opcode_val = model.evaluate(shared_opcode)
                    print(f"COLLISION FOUND: {current_name} collides with {prev_name}")
                    try:
                        opcode_int = opcode_val.as_long()
                        print(f"Conflicting opcode: {opcode_val} (0x{opcode_int:08x})")
                    except:
                        print(f"Conflicting opcode: {opcode_val}")
                    
                    # Restore state
                    self.solver = original_solver
                    self.opcode = original_opcode
                    return prev_name
                
                # Restore state for next iteration
                self.solver = original_solver
                self.opcode = original_opcode
                    
            except Exception as e:
                print(f"ERROR testing collision between {current_name} and {prev_name}: {e}")
                # Restore state on error
                self.solver = original_solver
                self.opcode = original_opcode
                continue
        
        return None
    
    def analyze_instruction_overlaps(self, instructions_file: str, support_file: str) -> None:
        """Find all pairs of instructions that could be simultaneously satisfied using O(n) SMT calls."""
        print("\n=== INSTRUCTION OVERLAP ANALYSIS ===")
        
        # Parse instruction blocks and backwards_matches functions
        instructions = self.parse_instruction_blocks(instructions_file)
        backwards_matches = self.parse_backwards_matches_functions(support_file)
        
        # Create a solver for the accumulating disjunction
        overlap_solver = Solver()
        accumulated_constraints = []
        processed_instructions = []
        total_collisions_found = 0
        
        for i, instruction in enumerate(instructions):
            # Create constraint for current instruction
            # Use a fresh solver and variables for this instruction
            temp_solver = Solver()
            temp_opcode = BitVec('opcode', 32)
            
            # Temporarily override instance variables
            original_solver = self.solver
            original_opcode = self.opcode
            
            self.solver = temp_solver
            self.opcode = temp_opcode
            
            try:
                current_constraint = self.generate_constraint_for_instruction(instruction, backwards_matches)
                
                # Restore original variables before testing overlap
                self.solver = original_solver
                self.opcode = original_opcode
                
                # If we have accumulated constraints, test for overlap
                if accumulated_constraints:
                    # Create fresh solver for overlap test
                    test_solver = Solver()
                    
                    # Add disjunction of previous constraints
                    previous_disjunction = Or(accumulated_constraints)
                    test_solver.add(previous_disjunction)
                    
                    # Add current constraint
                    test_solver.add(current_constraint)
                    
                    # Check if they can be satisfied together (no verbose output for coarse check)
                    result = test_solver.check()
                    if result == sat:
                        print(f"OVERLAP FOUND: Instruction {instruction['encoding']} overlaps with previous instructions")
                        
                        # Find all specific collision pairs
                        colliding_instructions = self.find_all_collision_pairs(instruction, processed_instructions, backwards_matches)
                        if colliding_instructions:
                            total_collisions_found += len(colliding_instructions)
                            print(f"Found {len(colliding_instructions)} collision(s) for {instruction['encoding']}: {', '.join(colliding_instructions)}")
                        
                        # Continue searching instead of returning
                
                # Add current constraint to accumulated disjunction and processed list
                accumulated_constraints.append(current_constraint)
                processed_instructions.append(instruction)
                
                if (i + 1) % 50 == 0:
                    print(f"Processed {i + 1}/{len(instructions)} instructions...")
                
            except Exception as e:
                print(f"ERROR processing {instruction['encoding']}: {e}")
                # Restore variables even on error
                self.solver = original_solver
                self.opcode = original_opcode
                continue
        
        print(f"Finished analyzing {len(instructions)} instructions for overlaps")
        print(f"Total collision pairs found: {total_collisions_found}")
    
    def print_smtlib_for_all_instructions(self, instructions_file: str, support_file: str, 
                                           specific_instruction: str = None) -> None:
        """Print SMTLib for all instructions (or a specific one) for debugging."""
        if specific_instruction:
            print(f"=== SMTLib OUTPUT FOR {specific_instruction} ===\n")
        else:
            print("=== SMTLib OUTPUT FOR ALL INSTRUCTIONS ===\n")
        
        # Parse instruction blocks and backwards_matches functions
        instructions = self.parse_instruction_blocks(instructions_file)
        backwards_matches = self.parse_backwards_matches_functions(support_file)
        
        # Filter to specific instruction if requested
        if specific_instruction:
            instructions = [instr for instr in instructions if instr['encoding'] == specific_instruction]
            if not instructions:
                print(f"Instruction '{specific_instruction}' not found")
                return
        
        for instruction in instructions:
            print(f"; Instruction: {instruction['encoding']}")
            print(f"; Guard: {instruction['guard']}")
            print(f"; Opcode: {instruction['opcode_pattern']}")
            print(f"; Fields: {instruction['fields']}")
            
            # Create fresh solver for this instruction
            temp_solver = Solver()
            temp_opcode = BitVec('opcode', 32)
            
            # Save original state
            original_solver = self.solver
            original_opcode = self.opcode
            
            self.solver = temp_solver
            self.opcode = temp_opcode
            
            try:
                constraint = self.generate_constraint_for_instruction(instruction, backwards_matches)
                temp_solver.add(constraint)
                
                # Print SMTLib
                print("(declare-fun opcode () (_ BitVec 32))")
                
                # Print the constraint
                print(f"(assert {constraint})")
                print("(check-sat)")
                print("(get-model)")
                print()
                
            except Exception as e:
                print(f"; ERROR: {e}")
                print()
            finally:
                # Restore original state
                self.solver = original_solver
                self.opcode = original_opcode
    
    def generate_constraints(self, instructions_file: str, support_file: str, 
                             single_instruction: str = None) -> None:
        """Generate SMT constraints for all instructions or a single instruction."""
        # Parse instruction blocks
        instructions = self.parse_instruction_blocks(instructions_file)
        
        # Parse backwards_matches functions
        backwards_matches = self.parse_backwards_matches_functions(support_file)
        
        print(f"Found {len(instructions)} instructions")
        print(f"Found {len(backwards_matches)} backwards_matches functions")
        
        # Filter to single instruction if specified
        if single_instruction:
            instructions = [instr for instr in instructions if instr['encoding'] == single_instruction]
            if not instructions:
                print(f"Instruction '{single_instruction}' not found")
                return
            print(f"Processing single instruction: {single_instruction}")
        
        # Generate constraints for each instruction
        successful_constraints = 0
        for instruction in instructions:
            try:
                constraint = self.generate_constraint_for_instruction(instruction, backwards_matches)
                
                # Add as a named assertion for this instruction
                self.solver.add(constraint)
                print(f"Added constraint for {instruction['encoding']}")
                successful_constraints += 1
                
            except Exception as e:
                print(f"Error processing {instruction['encoding']}: {e}")
                continue
        
        # Print solver statistics
        print(f"\nSolver has {len(self.solver.assertions())} assertions")
        print(f"Successfully processed {successful_constraints} out of {len(instructions)} instructions")
        
        # Check if constraints are satisfiable
        result = self.solver.check()
        print(f"Constraints are: {result}")
        
        if result == sat:
            model = self.solver.model()
            print(f"Model found with {len(model)} variables")
            
            # Print a few variable assignments
            for var in list(model.decls())[:5]:
                print(f"  {var.name()} = {model[var]}")
        
        # If single instruction, print more details
        if single_instruction and successful_constraints > 0:
            print(f"\nDetailed constraint for {single_instruction}:")
            print(self.solver.assertions()[-1])

def main():
    import sys
    
    # Check for verbose flag
    verbose = '--verbose' in sys.argv or '-v' in sys.argv
    if verbose:
        sys.argv = [arg for arg in sys.argv if arg not in ['--verbose', '-v']]
    
    generator = SMTConstraintGenerator(verbose=verbose)
    
    instructions_file = '../../asl_model/rv64d_instrs.asl'
    support_file = '../../asl_model/rv64d_support.asl'
    
    # Check command line arguments
    if len(sys.argv) > 1:
        command = sys.argv[1]
        
        if command == '--analyze-unsat':
            # Find unsatisfiable instructions
            generator.analyze_instruction_satisfiability(instructions_file, support_file)
        elif command == '--analyze-overlaps':
            # Find overlapping instruction pairs
            generator.analyze_instruction_overlaps(instructions_file, support_file)
        elif command == '--analyze-all':
            # Run both analyses
            generator.analyze_instruction_satisfiability(instructions_file, support_file)
            generator.analyze_instruction_overlaps(instructions_file, support_file)
        elif command == '--print-smtlib':
            # Print SMTLib for all instructions
            specific_instr = sys.argv[2] if len(sys.argv) > 2 else None
            generator.print_smtlib_for_all_instructions(instructions_file, support_file, specific_instr)
        elif command == '--help':
            print("Usage: python3 generate_smt_constraints.py [OPTIONS] [COMMAND]")
            print("")
            print("Commands:")
            print("  --analyze-unsat          Find unsatisfiable instructions")
            print("  --analyze-overlaps       Find overlapping instruction pairs")
            print("  --analyze-all           Run both analyses")
            print("  --print-smtlib [INSTR]  Print SMTLib for all or specific instruction")
            print("  INSTRUCTION_NAME         Generate constraints for specific instruction")
            print("")
            print("Options:")
            print("  --verbose, -v           Print detailed SMT queries and results")
            print("  --help                  Show this help message")
        else:
            # Treat as specific instruction name
            generator.generate_constraints(instructions_file, support_file, command)
    else:
        # Default behavior - generate all constraints
        generator.generate_constraints(instructions_file, support_file)

if __name__ == '__main__':
    main()