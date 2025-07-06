#!/usr/bin/env python3
"""
Parse ASL instruction blocks and extract encoding information.
"""

import re
from typing import List, Dict, Tuple, Optional

def parse_instruction_blocks(file_path: str) -> List[Dict]:
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
        
        # Parse fields  
        field_pattern = r'__field\s+(\w+)\s+\d+\s+\+:\s+\d+'
        fields = re.findall(field_pattern, instr_content)
        
        # Parse guard
        guard_match = re.search(r'__guard\s+(.+)', instr_content)
        guard = guard_match.group(1).strip() if guard_match else ""
        
        
        instructions.append({
            'name': instr_name,
            'encoding': encoding_name,
            'fields': fields,
            'guard': guard
        })
    
    return instructions

def extract_guard_functions(guard: str) -> List[str]:
    """Extract function calls from guard, removing and_bool wrappers."""
    if not guard:
        return []
    
    # Remove and_bool wrappers recursively
    def remove_and_bool(expr):
        expr = expr.strip()
        
        # If it starts with and_bool, parse it
        if expr.startswith('and_bool('):
            # Find the matching closing parenthesis for the and_bool
            paren_count = 0
            start_pos = 9  # After 'and_bool('
            
            # Find the comma that separates the two arguments
            comma_pos = -1
            for i in range(start_pos, len(expr)):
                if expr[i] == '(':
                    paren_count += 1
                elif expr[i] == ')':
                    paren_count -= 1
                elif expr[i] == ',' and paren_count == 0:
                    comma_pos = i
                    break
            
            if comma_pos != -1:
                # Find the closing parenthesis for the and_bool
                paren_count = 0
                close_pos = -1
                for i in range(comma_pos + 1, len(expr)):
                    if expr[i] == '(':
                        paren_count += 1
                    elif expr[i] == ')':
                        if paren_count == 0:
                            close_pos = i
                            break
                        else:
                            paren_count -= 1
                
                if close_pos != -1:
                    expr1 = expr[start_pos:comma_pos].strip()
                    expr2 = expr[comma_pos + 1:close_pos].strip()
                    return remove_and_bool(expr1) + remove_and_bool(expr2)
        
        # If it's not an and_bool, return it as is
        return [expr]
    
    return remove_and_bool(guard)

def parse_backwards_matches_function(content: str, func_name: str) -> List[str]:
    """Parse a backwards_matches function and extract eq_bits literals."""
    # Find the function definition
    pattern = rf'boolean\s+{re.escape(func_name)}\([^)]+\)\s*(.*?)(?=\n\n|\n[a-zA-Z].*\(|\Z)'
    match = re.search(pattern, content, re.DOTALL)
    
    if not match:
        return []
    
    func_body = match.group(1)
    
    # Check if it just returns TRUE
    if re.search(r'return\s+TRUE', func_body):
        return []
    
    # Extract all eq_bits literals
    eq_bits_pattern = r"eq_bits\([^,]+,\s*'([^']+)'\)"
    literals = re.findall(eq_bits_pattern, func_body)
    
    return literals

def binary_to_int(binary_str: str) -> int:
    """Convert binary string to unsigned integer."""
    return int(binary_str, 2)

def validate_binary_literals(literals: List[str], instruction: str, field: str) -> bool:
    """Validate that all binary literals have the same length and are unique."""
    if not literals:
        return True
    
    # Check if all literals have the same length
    first_length = len(literals[0])
    if not all(len(lit) == first_length for lit in literals):
        lengths = [len(lit) for lit in literals]
        print(f"ERROR: {instruction}.{field} - Binary literals have different lengths: {lengths}")
        print(f"       Literals: {literals}")
        return False
    
    # Check if all literals are unique
    if len(set(literals)) != len(literals):
        duplicates = [lit for lit in literals if literals.count(lit) > 1]
        print(f"ERROR: {instruction}.{field} - Duplicate binary literals found: {set(duplicates)}")
        print(f"       Literals: {literals}")
        return False
    
    return True

def main():
    # Parse instruction blocks
    instructions = parse_instruction_blocks('../../asl_model/rv64d_instrs.asl')
    
    # Read support file
    with open('../../asl_model/rv64d_support.asl', 'r') as f:
        support_content = f.read()
    
    # Collect OCaml match cases
    ocaml_cases = []
    
    # Process each instruction
    for instr in instructions:
        # Extract guard functions
        guard_functions = extract_guard_functions(instr['guard'])
        
        # Process each field that has a backwards_matches guard
        for func_call in guard_functions:
            if 'backwards_matches' in func_call:
                # Extract function name and argument
                func_match = re.match(r'(\w+backwards_matches)\(([^)]+)\)', func_call)
                if func_match:
                    func_name = func_match.group(1)
                    field_name = func_match.group(2)
                    
                    # Find corresponding field
                    if field_name in instr['fields']:
                        literals = parse_backwards_matches_function(support_content, func_name)
                        
                        # Convert to integers and create OCaml match case if non-empty
                        if literals:
                            # Validate literals before converting
                            if validate_binary_literals(literals, instr["encoding"], field_name):
                                int_literals = [binary_to_int(lit) for lit in literals]
                                ocaml_list = "[ " + "; ".join(map(str, int_literals)) + " ]"
                                ocaml_case = f'  | Ident "{instr["encoding"]}", "{field_name}" -> {ocaml_list}'
                                ocaml_cases.append(ocaml_case)
                            else:
                                print(f"SKIPPING: {instr['encoding']}.{field_name} due to validation errors")
                                print()
    
    # Print all OCaml match cases
    for case in ocaml_cases:
        print(case)

if __name__ == '__main__':
    main()