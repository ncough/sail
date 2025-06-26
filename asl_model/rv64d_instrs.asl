// Generated ASL instruction definitions

__instruction ADDIW_0
    __encoding ADDIW_0
        __instruction_set R64
        __field imm 20 +: 12
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx000xxxxx0011011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), eq_int(xlen, 64))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ADDIW(imm, rs1, rd);

__instruction AES32DSI_0
    __encoding AES32DSI_0
        __instruction_set R64
        __field bs 30 +: 2
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xx10101xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zknd), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_AES32DSI(bs, rs2, rs1, rd);

__instruction AES32DSMI_0
    __encoding AES32DSMI_0
        __instruction_set R64
        __field bs 30 +: 2
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xx10111xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zknd), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_AES32DSMI(bs, rs2, rs1, rd);

__instruction AES32ESI_0
    __encoding AES32ESI_0
        __instruction_set R64
        __field bs 30 +: 2
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xx10001xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zkne), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_AES32ESI(bs, rs2, rs1, rd);

__instruction AES32ESMI_0
    __encoding AES32ESMI_0
        __instruction_set R64
        __field bs 30 +: 2
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xx10011xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zkne), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_AES32ESMI(bs, rs2, rs1, rd);

__instruction AES64DS_0
    __encoding AES64DS_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0011101xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zknd), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_AES64DS(rs2, rs1, rd);

__instruction AES64DSM_0
    __encoding AES64DSM_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0011111xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zknd), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_AES64DSM(rs2, rs1, rd);

__instruction AES64ES_0
    __encoding AES64ES_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0011001xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zkne), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_AES64ES(rs2, rs1, rd);

__instruction AES64ESM_0
    __encoding AES64ESM_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0011011xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zkne), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_AES64ESM(rs2, rs1, rd);

__instruction AES64IM_0
    __encoding AES64IM_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '001100000000xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zknd), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_AES64IM(rs1, rd);

__instruction AES64KS1I_0
    __encoding AES64KS1I_0
        __instruction_set R64
        __field rnum 20 +: 4
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '00110001xxxxxxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(or_bool(currentlyEnabled(Ext_Zkne), currentlyEnabled(Ext_Zknd)), and_bool(eq_int(xlen, 64), ult_bits(rnum, '1011'))))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_AES64KS1I(rnum, rs1, rd);

__instruction AES64KS2_0
    __encoding AES64KS2_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0111111xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(or_bool(currentlyEnabled(Ext_Zkne), currentlyEnabled(Ext_Zknd)), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_AES64KS2(rs2, rs1, rd);

__instruction AMO_0
    __encoding AMO_0
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 26 +: 1
        __field mapping2XH 25 +: 1
        __field mapping3XH 20 +: 5
        __field mapping4XH 15 +: 5
        __field mapping5XH 12 +: 2
        __field mapping6XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx0xxxxxxx0101111'
        __guard and_bool(and_bool(encdec_amoop_backwards_matches(mapping0XH), and_bool(bool_bits_backwards_matches(mapping1XH), and_bool(bool_bits_backwards_matches(mapping2XH), and_bool(encdec_reg_backwards_matches(mapping3XH), and_bool(encdec_reg_backwards_matches(mapping4XH), and_bool(size_enc_backwards_matches(mapping5XH), encdec_reg_backwards_matches(mapping6XH))))))), and_bool(currentlyEnabled(Ext_Zaamo), amo_width_valid(size_enc_backwards(mapping5XH))))
        __decode
            return;

    __execute
        amoop op;
        boolean aq;
        boolean rl;
        bits(5) rs2;
        bits(5) rs1;
        word_width size;
        bits(5) rd;
        (op, aq, rl, rs2, rs1, size, rd) = (encdec_amoop_backwards(mapping0XH), bool_bits_backwards(mapping1XH), bool_bits_backwards(mapping2XH), encdec_reg_backwards(mapping3XH), encdec_reg_backwards(mapping4XH), size_enc_backwards(mapping5XH), encdec_reg_backwards(mapping6XH));
        - = execute_AMO(op, aq, rl, rs2, rs1, size, rd);

__instruction BREV8_0
    __encoding BREV8_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011010000111xxxxx101xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zbkb))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_BREV8(rs1, rd);

__instruction BTYPE_0
    __encoding BTYPE_0
        __instruction_set R64
        __field imm7_6 31 +: 1
        __field imm7_5_0 25 +: 6
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field imm5_4_1 8 +: 4
        __field imm5_0 7 +: 1
        __opcode 'xxxxxxxxxxxxxxxxxxxxxxxxx1100011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_bop_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bop op;
        (rs2, rs1, op) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_bop_backwards(mapping2XH));
        - = execute_BTYPE(bitvector_concat(imm7_6, bitvector_concat(imm5_0, bitvector_concat(imm7_5_0, bitvector_concat(imm5_4_1, '0')))), rs2, rs1, op);

__instruction CLMUL_0
    __encoding CLMUL_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000101xxxxxxxxxx001xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), or_bool(currentlyEnabled(Ext_Zbc), currentlyEnabled(Ext_Zbkc)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_CLMUL(rs2, rs1, rd);

__instruction CLMULH_0
    __encoding CLMULH_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000101xxxxxxxxxx011xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), or_bool(currentlyEnabled(Ext_Zbc), currentlyEnabled(Ext_Zbkc)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_CLMULH(rs2, rs1, rd);

__instruction CLMULR_0
    __encoding CLMULR_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000101xxxxxxxxxx010xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbc))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_CLMULR(rs2, rs1, rd);

__instruction CLZ_0
    __encoding CLZ_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011000000000xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zbb))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_CLZ(rs1, rd);

__instruction CLZW_0
    __encoding CLZW_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011000000000xxxxx001xxxxx0011011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbb), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_CLZW(rs1, rd);

__instruction CPOP_0
    __encoding CPOP_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011000000010xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zbb))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_CPOP(rs1, rd);

__instruction CPOPW_0
    __encoding CPOPW_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011000000010xxxxx001xxxxx0011011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbb), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_CPOPW(rs1, rd);

__instruction CSRImm_0
    __encoding CSRImm_0
        __instruction_set R64
        __field csr 20 +: 12
        __field imm 15 +: 5
        __field mapping0XH 12 +: 2
        __field mapping1XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx1xxxxxxx1110011'
        __guard and_bool(and_bool(encdec_csrop_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zicsr))
        __decode
            return;

    __execute
        csrop op;
        bits(5) rd;
        (op, rd) = (encdec_csrop_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_CSRImm(csr, imm, rd, op);

__instruction CSRReg_0
    __encoding CSRReg_0
        __instruction_set R64
        __field csr 20 +: 12
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 2
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx0xxxxxxx1110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_csrop_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zicsr))
        __decode
            return;

    __execute
        bits(5) rs1;
        csrop op;
        bits(5) rd;
        (rs1, op, rd) = (encdec_reg_backwards(mapping0XH), encdec_csrop_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_CSRReg(csr, rs1, rd, op);

__instruction CTZ_0
    __encoding CTZ_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011000000001xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zbb))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_CTZ(rs1, rd);

__instruction CTZW_0
    __encoding CTZW_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011000000001xxxxx001xxxxx0011011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbb), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_CTZW(rs1, rd);

__instruction DIV_0
    __encoding DIV_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 1
        __field mapping3XH 7 +: 5
        __opcode '0000001xxxxxxxxxx10xxxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(bool_not_bits_backwards_matches(mapping2XH), encdec_reg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_M))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        boolean s;
        bits(5) rd;
        (rs2, rs1, s, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), bool_not_bits_backwards(mapping2XH), encdec_reg_backwards(mapping3XH));
        - = execute_DIV(rs2, rs1, rd, s);

__instruction DIVW_0
    __encoding DIVW_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 1
        __field mapping3XH 7 +: 5
        __opcode '0000001xxxxxxxxxx10xxxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(bool_not_bits_backwards_matches(mapping2XH), encdec_reg_backwards_matches(mapping3XH)))), and_bool(eq_int(xlen, 64), currentlyEnabled(Ext_M)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        boolean s;
        bits(5) rd;
        (rs2, rs1, s, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), bool_not_bits_backwards(mapping2XH), encdec_reg_backwards(mapping3XH));
        - = execute_DIVW(rs2, rs1, rd, s);

__instruction EBREAK_0
    __encoding EBREAK_0
        __instruction_set R64
        __opcode '00000000000100000000000001110011'
        __guard TRUE
        __decode
            return;

    __execute
        - = execute_EBREAK();

__instruction ECALL_0
    __encoding ECALL_0
        __instruction_set R64
        __opcode '00000000000000000000000001110011'
        __guard TRUE
        __decode
            return;

    __execute
        - = execute_ECALL();

__instruction FCVTMOD_W_D_0
    __encoding FCVTMOD_W_D_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '110000101000xxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_D), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_FCVTMOD_W_D(rs1, rd);

__instruction FENCE_0
    __encoding FENCE_0
        __instruction_set R64
        __field pred 24 +: 4
        __field succ 20 +: 4
        __opcode '0000xxxxxxxx00000000000000001111'
        __guard TRUE
        __decode
            return;

    __execute
        - = execute_FENCE(pred, succ);

__instruction FENCEI_0
    __encoding FENCEI_0
        __instruction_set R64
        __opcode '00000000000000000001000000001111'
        __guard currentlyEnabled(Ext_Zifencei)
        __decode
            return;

    __execute
        - = execute_FENCEI();

__instruction FENCEI_RESERVED_0
    __encoding FENCEI_RESERVED_0
        __instruction_set R64
        __field imm 20 +: 12
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx001xxxxx0001111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), or_bool(neq_bits(imm, '000000000000'), or_bool(encdec_reg_backwards(mapping0XH) != zreg, encdec_reg_backwards(mapping1XH) != zreg)))
        __decode
            return;

    __execute
        bits(5) rs;
        bits(5) rd;
        (rs, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_FENCEI_RESERVED(imm, rs, rd);

__instruction FENCE_RESERVED_0
    __encoding FENCE_RESERVED_0
        __instruction_set R64
        __field fm 28 +: 4
        __field pred 24 +: 4
        __field succ 20 +: 4
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx000xxxxx0001111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), or_bool(and_bool(neq_bits(fm, '0000'), neq_bits(fm, '1000')), or_bool(encdec_reg_backwards(mapping0XH) != zreg, encdec_reg_backwards(mapping1XH) != zreg)))
        __decode
            return;

    __execute
        bits(5) rs;
        bits(5) rd;
        (rs, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_FENCE_RESERVED(fm, pred, succ, rs, rd);

__instruction FENCE_TSO_0
    __encoding FENCE_TSO_0
        __instruction_set R64
        __opcode '10000011001100000000000000001111'
        __guard TRUE
        __decode
            return;

    __execute
        - = execute_FENCE_TSO();

__instruction FLEQ_D_0
    __encoding FLEQ_D_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010001xxxxxxxxxx100xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_D), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_FLEQ_D(rs2, rs1, rd);

__instruction FLEQ_H_0
    __encoding FLEQ_H_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010010xxxxxxxxxx100xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zfh), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_FLEQ_H(rs2, rs1, rd);

__instruction FLEQ_S_0
    __encoding FLEQ_S_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010000xxxxxxxxxx100xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zfa))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_FLEQ_S(rs2, rs1, rd);

__instruction FLI_D_0
    __encoding FLI_D_0
        __instruction_set R64
        __field constantidx 15 +: 5
        __field mapping0XH 7 +: 5
        __opcode '111100100001xxxxx000xxxxx1010011'
        __guard and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(currentlyEnabled(Ext_D), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        constant bits(5) rd = encdec_freg_backwards(mapping0XH);
        - = execute_FLI_D(constantidx, rd);

__instruction FLI_H_0
    __encoding FLI_H_0
        __instruction_set R64
        __field constantidx 15 +: 5
        __field mapping0XH 7 +: 5
        __opcode '111101000001xxxxx000xxxxx1010011'
        __guard and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(currentlyEnabled(Ext_Zfh), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        constant bits(5) rd = encdec_freg_backwards(mapping0XH);
        - = execute_FLI_H(constantidx, rd);

__instruction FLI_S_0
    __encoding FLI_S_0
        __instruction_set R64
        __field constantidx 15 +: 5
        __field mapping0XH 7 +: 5
        __opcode '111100000001xxxxx000xxxxx1010011'
        __guard and_bool(encdec_freg_backwards_matches(mapping0XH), currentlyEnabled(Ext_Zfa))
        __decode
            return;

    __execute
        constant bits(5) rd = encdec_freg_backwards(mapping0XH);
        - = execute_FLI_S(constantidx, rd);

__instruction FLTQ_D_0
    __encoding FLTQ_D_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010001xxxxxxxxxx101xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_D), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_FLTQ_D(rs2, rs1, rd);

__instruction FLTQ_H_0
    __encoding FLTQ_H_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010010xxxxxxxxxx101xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zfh), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_FLTQ_H(rs2, rs1, rd);

__instruction FLTQ_S_0
    __encoding FLTQ_S_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010000xxxxxxxxxx101xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zfa))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_FLTQ_S(rs2, rs1, rd);

__instruction FMAXM_D_0
    __encoding FMAXM_D_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010101xxxxxxxxxx011xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_D), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FMAXM_D(rs2, rs1, rd);

__instruction FMAXM_H_0
    __encoding FMAXM_H_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010110xxxxxxxxxx011xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zfh), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FMAXM_H(rs2, rs1, rd);

__instruction FMAXM_S_0
    __encoding FMAXM_S_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010100xxxxxxxxxx011xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zfa))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FMAXM_S(rs2, rs1, rd);

__instruction FMINM_D_0
    __encoding FMINM_D_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010101xxxxxxxxxx010xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_D), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FMINM_D(rs2, rs1, rd);

__instruction FMINM_H_0
    __encoding FMINM_H_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010110xxxxxxxxxx010xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zfh), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FMINM_H(rs2, rs1, rd);

__instruction FMINM_S_0
    __encoding FMINM_S_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010100xxxxxxxxxx010xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zfa))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FMINM_S(rs2, rs1, rd);

__instruction FMVH_X_D_0
    __encoding FMVH_X_D_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '111000100001xxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_D), and_bool(currentlyEnabled(Ext_Zfa), in32BitMode())))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_FMVH_X_D(rs1, rd);

__instruction FMVP_D_X_0
    __encoding FMVP_D_X_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1011001xxxxxxxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_D), and_bool(currentlyEnabled(Ext_Zfa), in32BitMode())))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FMVP_D_X(rs2, rs1, rd);

__instruction FROUNDNX_D_0
    __encoding FROUNDNX_D_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010000100101xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_D), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FROUNDNX_D(rs1, rm, rd);

__instruction FROUNDNX_H_0
    __encoding FROUNDNX_H_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010001000101xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zfh), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FROUNDNX_H(rs1, rm, rd);

__instruction FROUNDNX_S_0
    __encoding FROUNDNX_S_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010000000101xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zfa))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FROUNDNX_S(rs1, rm, rd);

__instruction FROUND_D_0
    __encoding FROUND_D_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010000100100xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_D), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FROUND_D(rs1, rm, rd);

__instruction FROUND_H_0
    __encoding FROUND_H_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010001000100xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zfh), currentlyEnabled(Ext_Zfa)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FROUND_H(rs1, rm, rd);

__instruction FROUND_S_0
    __encoding FROUND_S_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010000000100xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zfa))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_FROUND_S(rs1, rm, rd);

__instruction FVFMATYPE_0
    __encoding FVFMATYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx101xxxxx1010111'
        __guard and_bool(and_bool(encdec_fvfmafunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fvfmafunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_fvfmafunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FVFMATYPE(funct6, vm, vs2, rs1, vd);

__instruction FVFMTYPE_0
    __encoding FVFMTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx101xxxxx1010111'
        __guard and_bool(and_bool(encdec_fvfmfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fvfmfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_fvfmfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FVFMTYPE(funct6, vm, vs2, rs1, vd);

__instruction FVFTYPE_0
    __encoding FVFTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx101xxxxx1010111'
        __guard and_bool(and_bool(encdec_fvffunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fvffunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_fvffunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FVFTYPE(funct6, vm, vs2, rs1, vd);

__instruction FVVMATYPE_0
    __encoding FVVMATYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_fvvmafunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fvvmafunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_fvvmafunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FVVMATYPE(funct6, vm, vs2, vs1, vd);

__instruction FVVMTYPE_0
    __encoding FVVMTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_fvvmfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fvvmfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_fvvmfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FVVMTYPE(funct6, vm, vs2, vs1, vd);

__instruction FVVTYPE_0
    __encoding FVVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_fvvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fvvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_fvvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FVVTYPE(funct6, vm, vs2, vs1, vd);

__instruction FWFTYPE_0
    __encoding FWFTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx101xxxxx1010111'
        __guard and_bool(and_bool(encdec_fwffunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fwffunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_fwffunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FWFTYPE(funct6, vm, vs2, rs1, vd);

__instruction FWVFMATYPE_0
    __encoding FWVFMATYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx101xxxxx1010111'
        __guard and_bool(and_bool(encdec_fwvfmafunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fwvfmafunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_fwvfmafunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FWVFMATYPE(funct6, vm, rs1, vs2, vd);

__instruction FWVFTYPE_0
    __encoding FWVFTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx101xxxxx1010111'
        __guard and_bool(and_bool(encdec_fwvffunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fwvffunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_fwvffunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FWVFTYPE(funct6, vm, vs2, rs1, vd);

__instruction FWVTYPE_0
    __encoding FWVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_fwvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fwvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_fwvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FWVTYPE(funct6, vm, vs2, vs1, vd);

__instruction FWVVMATYPE_0
    __encoding FWVVMATYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_fwvvmafunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fwvvmafunct6 funct6;
        bits(5) vs1;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs1, vs2, vd) = (encdec_fwvvmafunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FWVVMATYPE(funct6, vm, vs1, vs2, vd);

__instruction FWVVTYPE_0
    __encoding FWVVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_fwvvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        fwvvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_fwvvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_FWVVTYPE(funct6, vm, vs2, vs1, vd);

__instruction F_BIN_F_TYPE_D_0
    __encoding F_BIN_F_TYPE_D_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010101xxxxxxxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(3, encdec_freg_backwards(mapping2XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_F_TYPE_D(rs2, rs1, rd, FMAXX_D);

__instruction F_BIN_F_TYPE_D_1
    __encoding F_BIN_F_TYPE_D_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010101xxxxxxxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(3, encdec_freg_backwards(mapping2XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_F_TYPE_D(rs2, rs1, rd, FMIN_D);

__instruction F_BIN_F_TYPE_D_2
    __encoding F_BIN_F_TYPE_D_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010001xxxxxxxxxx010xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(3, encdec_freg_backwards(mapping2XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_F_TYPE_D(rs2, rs1, rd, FSGNJXX_D);

__instruction F_BIN_F_TYPE_D_3
    __encoding F_BIN_F_TYPE_D_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010001xxxxxxxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(3, encdec_freg_backwards(mapping2XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_F_TYPE_D(rs2, rs1, rd, FSGNJN_D);

__instruction F_BIN_F_TYPE_D_4
    __encoding F_BIN_F_TYPE_D_4
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010001xxxxxxxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(3, encdec_freg_backwards(mapping2XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_F_TYPE_D(rs2, rs1, rd, FSGNJ_D);

__instruction F_BIN_F_TYPE_H_0
    __encoding F_BIN_F_TYPE_H_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010110xxxxxxxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_F_TYPE_H(rs2, rs1, rd, FMAXX_H);

__instruction F_BIN_F_TYPE_H_1
    __encoding F_BIN_F_TYPE_H_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010110xxxxxxxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_F_TYPE_H(rs2, rs1, rd, FMIN_H);

__instruction F_BIN_F_TYPE_H_2
    __encoding F_BIN_F_TYPE_H_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010010xxxxxxxxxx010xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_F_TYPE_H(rs2, rs1, rd, FSGNJXX_H);

__instruction F_BIN_F_TYPE_H_3
    __encoding F_BIN_F_TYPE_H_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010010xxxxxxxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_F_TYPE_H(rs2, rs1, rd, FSGNJN_H);

__instruction F_BIN_F_TYPE_H_4
    __encoding F_BIN_F_TYPE_H_4
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010010xxxxxxxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_F_TYPE_H(rs2, rs1, rd, FSGNJ_H);

__instruction F_BIN_RM_TYPE_D_0
    __encoding F_BIN_RM_TYPE_D_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0001101xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), and_bool(haveDoubleFPU(), validDoubleRegs(3, encdec_freg_backwards(mapping3XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_D(rs2, rs1, rm, rd, FDIV_D);

__instruction F_BIN_RM_TYPE_D_1
    __encoding F_BIN_RM_TYPE_D_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0001001xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), and_bool(haveDoubleFPU(), validDoubleRegs(3, encdec_freg_backwards(mapping3XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_D(rs2, rs1, rm, rd, FMUL_D);

__instruction F_BIN_RM_TYPE_D_2
    __encoding F_BIN_RM_TYPE_D_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0000101xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), and_bool(haveDoubleFPU(), validDoubleRegs(3, encdec_freg_backwards(mapping3XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_D(rs2, rs1, rm, rd, FSUB_D);

__instruction F_BIN_RM_TYPE_D_3
    __encoding F_BIN_RM_TYPE_D_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0000001xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), and_bool(haveDoubleFPU(), validDoubleRegs(3, encdec_freg_backwards(mapping3XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_D(rs2, rs1, rm, rd, FADD_D);

__instruction F_BIN_RM_TYPE_H_0
    __encoding F_BIN_RM_TYPE_H_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0001110xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_H(rs2, rs1, rm, rd, FDIV_H);

__instruction F_BIN_RM_TYPE_H_1
    __encoding F_BIN_RM_TYPE_H_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0001010xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_H(rs2, rs1, rm, rd, FMUL_H);

__instruction F_BIN_RM_TYPE_H_2
    __encoding F_BIN_RM_TYPE_H_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0000110xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_H(rs2, rs1, rm, rd, FSUB_H);

__instruction F_BIN_RM_TYPE_H_3
    __encoding F_BIN_RM_TYPE_H_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0000010xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_H(rs2, rs1, rm, rd, FADD_H);

__instruction F_BIN_RM_TYPE_S_0
    __encoding F_BIN_RM_TYPE_S_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0001100xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_S(rs2, rs1, rm, rd, FDIV_S);

__instruction F_BIN_RM_TYPE_S_1
    __encoding F_BIN_RM_TYPE_S_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0001000xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_S(rs2, rs1, rm, rd, FMUL_S);

__instruction F_BIN_RM_TYPE_S_2
    __encoding F_BIN_RM_TYPE_S_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0000100xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_S(rs2, rs1, rm, rd, FSUB_S);

__instruction F_BIN_RM_TYPE_S_3
    __encoding F_BIN_RM_TYPE_S_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0000000xxxxxxxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_rounding_mode_backwards_matches(mapping2XH), encdec_freg_backwards_matches(mapping3XH)))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_rounding_mode_backwards(mapping2XH), encdec_freg_backwards(mapping3XH));
        - = execute_F_BIN_RM_TYPE_S(rs2, rs1, rm, rd, FADD_S);

__instruction F_BIN_TYPE_F_S_0
    __encoding F_BIN_TYPE_F_S_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010100xxxxxxxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_TYPE_F_S(rs2, rs1, rd, FMAXX_S);

__instruction F_BIN_TYPE_F_S_1
    __encoding F_BIN_TYPE_F_S_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010100xxxxxxxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_TYPE_F_S(rs2, rs1, rd, FMIN_S);

__instruction F_BIN_TYPE_F_S_2
    __encoding F_BIN_TYPE_F_S_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010000xxxxxxxxxx010xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_TYPE_F_S(rs2, rs1, rd, FSGNJXX_S);

__instruction F_BIN_TYPE_F_S_3
    __encoding F_BIN_TYPE_F_S_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010000xxxxxxxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_TYPE_F_S(rs2, rs1, rd, FSGNJN_S);

__instruction F_BIN_TYPE_F_S_4
    __encoding F_BIN_TYPE_F_S_4
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010000xxxxxxxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_BIN_TYPE_F_S(rs2, rs1, rd, FSGNJ_S);

__instruction F_BIN_TYPE_X_S_0
    __encoding F_BIN_TYPE_X_S_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010000xxxxxxxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_BIN_TYPE_X_S(rs2, rs1, rd, FLE_S);

__instruction F_BIN_TYPE_X_S_1
    __encoding F_BIN_TYPE_X_S_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010000xxxxxxxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_BIN_TYPE_X_S(rs2, rs1, rd, FLT_S);

__instruction F_BIN_TYPE_X_S_2
    __encoding F_BIN_TYPE_X_S_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010000xxxxxxxxxx010xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_BIN_TYPE_X_S(rs2, rs1, rd, FEQ_S);

__instruction F_BIN_X_TYPE_D_0
    __encoding F_BIN_X_TYPE_D_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010001xxxxxxxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(2, encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_BIN_X_TYPE_D(rs2, rs1, rd, FLE_D);

__instruction F_BIN_X_TYPE_D_1
    __encoding F_BIN_X_TYPE_D_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010001xxxxxxxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(2, encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_BIN_X_TYPE_D(rs2, rs1, rd, FLT_D);

__instruction F_BIN_X_TYPE_D_2
    __encoding F_BIN_X_TYPE_D_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010001xxxxxxxxxx010xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(2, encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_BIN_X_TYPE_D(rs2, rs1, rd, FEQ_D);

__instruction F_BIN_X_TYPE_H_0
    __encoding F_BIN_X_TYPE_H_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010010xxxxxxxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_BIN_X_TYPE_H(rs2, rs1, rd, FLE_H);

__instruction F_BIN_X_TYPE_H_1
    __encoding F_BIN_X_TYPE_H_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010010xxxxxxxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_BIN_X_TYPE_H(rs2, rs1, rd, FLT_H);

__instruction F_BIN_X_TYPE_H_2
    __encoding F_BIN_X_TYPE_H_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1010010xxxxxxxxxx010xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_BIN_X_TYPE_H(rs2, rs1, rd, FEQ_H);

__instruction F_MADD_TYPE_D_0
    __encoding F_MADD_TYPE_D_0
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx01xxxxxxxxxxxxxxxxxx1001111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), and_bool(haveDoubleFPU(), validDoubleRegs(4, encdec_freg_backwards(mapping4XH):encdec_freg_backwards(mapping2XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_D(rs3, rs2, rs1, rm, rd, FNMADD_D);

__instruction F_MADD_TYPE_D_1
    __encoding F_MADD_TYPE_D_1
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx01xxxxxxxxxxxxxxxxxx1001011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), and_bool(haveDoubleFPU(), validDoubleRegs(4, encdec_freg_backwards(mapping4XH):encdec_freg_backwards(mapping2XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_D(rs3, rs2, rs1, rm, rd, FNMSUB_D);

__instruction F_MADD_TYPE_D_2
    __encoding F_MADD_TYPE_D_2
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx01xxxxxxxxxxxxxxxxxx1000111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), and_bool(haveDoubleFPU(), validDoubleRegs(4, encdec_freg_backwards(mapping4XH):encdec_freg_backwards(mapping2XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_D(rs3, rs2, rs1, rm, rd, FMSUB_D);

__instruction F_MADD_TYPE_D_3
    __encoding F_MADD_TYPE_D_3
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx01xxxxxxxxxxxxxxxxxx1000011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), and_bool(haveDoubleFPU(), validDoubleRegs(4, encdec_freg_backwards(mapping4XH):encdec_freg_backwards(mapping2XH):encdec_freg_backwards(mapping1XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_D(rs3, rs2, rs1, rm, rd, FMADD_D);

__instruction F_MADD_TYPE_H_0
    __encoding F_MADD_TYPE_H_0
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx10xxxxxxxxxxxxxxxxxx1001111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_H(rs3, rs2, rs1, rm, rd, FNMADD_H);

__instruction F_MADD_TYPE_H_1
    __encoding F_MADD_TYPE_H_1
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx10xxxxxxxxxxxxxxxxxx1001011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_H(rs3, rs2, rs1, rm, rd, FNMSUB_H);

__instruction F_MADD_TYPE_H_2
    __encoding F_MADD_TYPE_H_2
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx10xxxxxxxxxxxxxxxxxx1000111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_H(rs3, rs2, rs1, rm, rd, FMSUB_H);

__instruction F_MADD_TYPE_H_3
    __encoding F_MADD_TYPE_H_3
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx10xxxxxxxxxxxxxxxxxx1000011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_H(rs3, rs2, rs1, rm, rd, FMADD_H);

__instruction F_MADD_TYPE_S_0
    __encoding F_MADD_TYPE_S_0
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx00xxxxxxxxxxxxxxxxxx1001111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_S(rs3, rs2, rs1, rm, rd, FNMADD_S);

__instruction F_MADD_TYPE_S_1
    __encoding F_MADD_TYPE_S_1
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx00xxxxxxxxxxxxxxxxxx1001011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_S(rs3, rs2, rs1, rm, rd, FNMSUB_S);

__instruction F_MADD_TYPE_S_2
    __encoding F_MADD_TYPE_S_2
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx00xxxxxxxxxxxxxxxxxx1000111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_S(rs3, rs2, rs1, rm, rd, FMSUB_S);

__instruction F_MADD_TYPE_S_3
    __encoding F_MADD_TYPE_S_3
        __instruction_set R64
        __field mapping0XH 27 +: 5
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 3
        __field mapping4XH 7 +: 5
        __opcode 'xxxxx00xxxxxxxxxxxxxxxxxx1000011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), and_bool(encdec_freg_backwards_matches(mapping2XH), and_bool(encdec_rounding_mode_backwards_matches(mapping3XH), encdec_freg_backwards_matches(mapping4XH))))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs3;
        bits(5) rs2;
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs3, rs2, rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_freg_backwards(mapping2XH), encdec_rounding_mode_backwards(mapping3XH), encdec_freg_backwards(mapping4XH));
        - = execute_F_MADD_TYPE_S(rs3, rs2, rs1, rm, rd, FMADD_S);

__instruction F_UN_F_TYPE_D_0
    __encoding F_UN_F_TYPE_D_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '111100100000xxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_freg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_D), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH));
        - = execute_F_UN_F_TYPE_D(rs1, rd, FMV_D_XX);

__instruction F_UN_F_TYPE_H_0
    __encoding F_UN_F_TYPE_H_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '111101000000xxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_freg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zfhmin))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH));
        - = execute_F_UN_F_TYPE_H(rs1, rd, FMV_H_XX);

__instruction F_UN_RM_FF_TYPE_D_0
    __encoding F_UN_RM_FF_TYPE_D_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010000100000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(1, encdec_freg_backwards(mapping2XH))))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_FF_TYPE_D(rs1, rm, rd, FCVT_D_S);

__instruction F_UN_RM_FF_TYPE_D_1
    __encoding F_UN_RM_FF_TYPE_D_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010000000001xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(1, encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_FF_TYPE_D(rs1, rm, rd, FCVT_S_D);

__instruction F_UN_RM_FF_TYPE_D_2
    __encoding F_UN_RM_FF_TYPE_D_2
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010110100000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(2, encdec_freg_backwards(mapping2XH):encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_FF_TYPE_D(rs1, rm, rd, FSQRT_D);

__instruction F_UN_RM_FF_TYPE_H_0
    __encoding F_UN_RM_FF_TYPE_H_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010000100010xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveHalfMin(), and_bool(haveDoubleFPU(), validDoubleRegs(1, encdec_freg_backwards(mapping2XH)))))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_FF_TYPE_H(rs1, rm, rd, FCVT_D_H);

__instruction F_UN_RM_FF_TYPE_H_1
    __encoding F_UN_RM_FF_TYPE_H_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010000000010xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveHalfMin())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_FF_TYPE_H(rs1, rm, rd, FCVT_S_H);

__instruction F_UN_RM_FF_TYPE_H_2
    __encoding F_UN_RM_FF_TYPE_H_2
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010001000001xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveHalfMin(), and_bool(haveDoubleFPU(), validDoubleRegs(1, encdec_freg_backwards(mapping0XH)))))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_FF_TYPE_H(rs1, rm, rd, FCVT_H_D);

__instruction F_UN_RM_FF_TYPE_H_3
    __encoding F_UN_RM_FF_TYPE_H_3
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010001000000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveHalfMin())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_FF_TYPE_H(rs1, rm, rd, FCVT_H_S);

__instruction F_UN_RM_FF_TYPE_H_4
    __encoding F_UN_RM_FF_TYPE_H_4
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010111000000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_FF_TYPE_H(rs1, rm, rd, FSQRT_H);

__instruction F_UN_RM_FF_TYPE_S_0
    __encoding F_UN_RM_FF_TYPE_S_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '010110000000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_FF_TYPE_S(rs1, rm, rd, FSQRT_S);

__instruction F_UN_RM_FX_TYPE_D_0
    __encoding F_UN_RM_FX_TYPE_D_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110000100011xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_D(rs1, rm, rd, FCVT_LU_D);

__instruction F_UN_RM_FX_TYPE_D_1
    __encoding F_UN_RM_FX_TYPE_D_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110000100010xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_D(rs1, rm, rd, FCVT_L_D);

__instruction F_UN_RM_FX_TYPE_D_2
    __encoding F_UN_RM_FX_TYPE_D_2
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110000100001xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(1, encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_D(rs1, rm, rd, FCVT_WU_D);

__instruction F_UN_RM_FX_TYPE_D_3
    __encoding F_UN_RM_FX_TYPE_D_3
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110000100000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(1, encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_D(rs1, rm, rd, FCVT_W_D);

__instruction F_UN_RM_FX_TYPE_H_0
    __encoding F_UN_RM_FX_TYPE_H_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110001000011xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveHalfFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_H(rs1, rm, rd, FCVT_LU_H);

__instruction F_UN_RM_FX_TYPE_H_1
    __encoding F_UN_RM_FX_TYPE_H_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110001000010xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveHalfFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_H(rs1, rm, rd, FCVT_L_H);

__instruction F_UN_RM_FX_TYPE_H_2
    __encoding F_UN_RM_FX_TYPE_H_2
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110001000001xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_H(rs1, rm, rd, FCVT_WU_H);

__instruction F_UN_RM_FX_TYPE_H_3
    __encoding F_UN_RM_FX_TYPE_H_3
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110001000000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_H(rs1, rm, rd, FCVT_W_H);

__instruction F_UN_RM_FX_TYPE_S_0
    __encoding F_UN_RM_FX_TYPE_S_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110000000011xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveSingleFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_S(rs1, rm, rd, FCVT_LU_S);

__instruction F_UN_RM_FX_TYPE_S_1
    __encoding F_UN_RM_FX_TYPE_S_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110000000010xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(haveSingleFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_S(rs1, rm, rd, FCVT_L_S);

__instruction F_UN_RM_FX_TYPE_S_2
    __encoding F_UN_RM_FX_TYPE_S_2
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110000000001xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_S(rs1, rm, rd, FCVT_WU_S);

__instruction F_UN_RM_FX_TYPE_S_3
    __encoding F_UN_RM_FX_TYPE_S_3
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110000000000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_freg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_F_UN_RM_FX_TYPE_S(rs1, rm, rd, FCVT_W_S);

__instruction F_UN_RM_XF_TYPE_D_0
    __encoding F_UN_RM_XF_TYPE_D_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110100100011xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_D(rs1, rm, rd, FCVT_D_LU);

__instruction F_UN_RM_XF_TYPE_D_1
    __encoding F_UN_RM_XF_TYPE_D_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110100100010xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_D(rs1, rm, rd, FCVT_D_L);

__instruction F_UN_RM_XF_TYPE_D_2
    __encoding F_UN_RM_XF_TYPE_D_2
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110100100001xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(1, encdec_freg_backwards(mapping2XH))))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_D(rs1, rm, rd, FCVT_D_WU);

__instruction F_UN_RM_XF_TYPE_D_3
    __encoding F_UN_RM_XF_TYPE_D_3
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110100100000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveDoubleFPU(), validDoubleRegs(1, encdec_freg_backwards(mapping2XH))))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_D(rs1, rm, rd, FCVT_D_W);

__instruction F_UN_RM_XF_TYPE_H_0
    __encoding F_UN_RM_XF_TYPE_H_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110101000011xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveHalfFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_H(rs1, rm, rd, FCVT_H_LU);

__instruction F_UN_RM_XF_TYPE_H_1
    __encoding F_UN_RM_XF_TYPE_H_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110101000010xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveHalfFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_H(rs1, rm, rd, FCVT_H_L);

__instruction F_UN_RM_XF_TYPE_H_2
    __encoding F_UN_RM_XF_TYPE_H_2
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110101000001xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_H(rs1, rm, rd, FCVT_H_WU);

__instruction F_UN_RM_XF_TYPE_H_3
    __encoding F_UN_RM_XF_TYPE_H_3
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110101000000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_H(rs1, rm, rd, FCVT_H_W);

__instruction F_UN_RM_XF_TYPE_S_0
    __encoding F_UN_RM_XF_TYPE_S_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110100000011xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveSingleFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_S(rs1, rm, rd, FCVT_S_LU);

__instruction F_UN_RM_XF_TYPE_S_1
    __encoding F_UN_RM_XF_TYPE_S_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110100000010xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), and_bool(haveSingleFPU(), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_S(rs1, rm, rd, FCVT_S_L);

__instruction F_UN_RM_XF_TYPE_S_2
    __encoding F_UN_RM_XF_TYPE_S_2
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110100000001xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_S(rs1, rm, rd, FCVT_S_WU);

__instruction F_UN_RM_XF_TYPE_S_3
    __encoding F_UN_RM_XF_TYPE_S_3
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode '110100000000xxxxxxxxxxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_rounding_mode_backwards_matches(mapping1XH), encdec_freg_backwards_matches(mapping2XH))), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        rounding_mode rm;
        bits(5) rd;
        (rs1, rm, rd) = (encdec_reg_backwards(mapping0XH), encdec_rounding_mode_backwards(mapping1XH), encdec_freg_backwards(mapping2XH));
        - = execute_F_UN_RM_XF_TYPE_S(rs1, rm, rd, FCVT_S_W);

__instruction F_UN_TYPE_F_S_0
    __encoding F_UN_TYPE_F_S_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '111100000000xxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_freg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_F))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH));
        - = execute_F_UN_TYPE_F_S(rs1, rd, FMV_W_XX);

__instruction F_UN_TYPE_X_S_0
    __encoding F_UN_TYPE_X_S_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '111000000000xxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_F))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_F_UN_TYPE_X_S(rs1, rd, FMV_XX_W);

__instruction F_UN_TYPE_X_S_1
    __encoding F_UN_TYPE_X_S_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '111000000000xxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), haveSingleFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_F_UN_TYPE_X_S(rs1, rd, FCLASS_S);

__instruction F_UN_X_TYPE_D_0
    __encoding F_UN_X_TYPE_D_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '111000100000xxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_D), gteq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_F_UN_X_TYPE_D(rs1, rd, FMV_XX_D);

__instruction F_UN_X_TYPE_D_1
    __encoding F_UN_X_TYPE_D_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '111000100000xxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(haveDoubleFPU(), validDoubleRegs(1, encdec_freg_backwards(mapping0XH))))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_F_UN_X_TYPE_D(rs1, rd, FCLASS_D);

__instruction F_UN_X_TYPE_H_0
    __encoding F_UN_X_TYPE_H_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '111001000000xxxxx000xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zfhmin))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_F_UN_X_TYPE_H(rs1, rd, FMV_XX_H);

__instruction F_UN_X_TYPE_H_1
    __encoding F_UN_X_TYPE_H_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '111001000000xxxxx001xxxxx1010011'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), haveHalfFPU())
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_F_UN_X_TYPE_H(rs1, rd, FCLASS_H);

__instruction ILLEGAL_0
    __encoding ILLEGAL_0
        __instruction_set R64
        __field s 0 +: 32
        __opcode 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        __guard TRUE
        __decode
            return;

    __execute
        - = execute_ILLEGAL(s);

__instruction ITYPE_0
    __encoding ITYPE_0
        __instruction_set R64
        __field imm 20 +: 12
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxxxxxxxxxx0010011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_iop_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs1;
        iop op;
        bits(5) rd;
        (rs1, op, rd) = (encdec_reg_backwards(mapping0XH), encdec_iop_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ITYPE(imm, rs1, rd, op);

__instruction JAL_0
    __encoding JAL_0
        __instruction_set R64
        __field imm_19 31 +: 1
        __field imm_18_13 25 +: 6
        __field imm_12_9 21 +: 4
        __field imm_8 20 +: 1
        __field imm_7_0 12 +: 8
        __field mapping0XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxxxxxxxxxx1101111'
        __guard encdec_reg_backwards_matches(mapping0XH)
        __decode
            return;

    __execute
        constant bits(5) rd = encdec_reg_backwards(mapping0XH);
        - = execute_JAL(bitvector_concat(imm_19, bitvector_concat(imm_7_0, bitvector_concat(imm_8, bitvector_concat(imm_18_13, bitvector_concat(imm_12_9, '0'))))), rd);

__instruction JALR_0
    __encoding JALR_0
        __instruction_set R64
        __field imm 20 +: 12
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx000xxxxx1100111'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_JALR(imm, rs1, rd);

__instruction LOAD_0
    __encoding LOAD_0
        __instruction_set R64
        __field imm 20 +: 12
        __field mapping0XH 15 +: 5
        __field mapping1XH 14 +: 1
        __field mapping2XH 12 +: 2
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxxxxxxxxxx0000011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(bool_bits_backwards_matches(mapping1XH), and_bool(size_enc_backwards_matches(mapping2XH), encdec_reg_backwards_matches(mapping3XH)))), valid_load_encdec(size_enc_backwards(mapping2XH), bool_bits_backwards(mapping1XH)))
        __decode
            return;

    __execute
        bits(5) rs1;
        boolean is_unsigned;
        word_width width;
        bits(5) rd;
        (rs1, is_unsigned, width, rd) = (encdec_reg_backwards(mapping0XH), bool_bits_backwards(mapping1XH), size_enc_backwards(mapping2XH), encdec_reg_backwards(mapping3XH));
        - = execute_LOAD(imm, rs1, rd, is_unsigned, width, FALSE, FALSE);

__instruction LOADRES_0
    __encoding LOADRES_0
        __instruction_set R64
        __field mapping0XH 26 +: 1
        __field mapping1XH 25 +: 1
        __field mapping2XH 15 +: 5
        __field mapping3XH 12 +: 2
        __field mapping4XH 7 +: 5
        __opcode '00010xx00000xxxxx0xxxxxxx0101111'
        __guard and_bool(and_bool(bool_bits_backwards_matches(mapping0XH), and_bool(bool_bits_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), and_bool(size_enc_backwards_matches(mapping3XH), encdec_reg_backwards_matches(mapping4XH))))), and_bool(currentlyEnabled(Ext_Zalrsc), lrsc_width_valid(size_enc_backwards(mapping3XH))))
        __decode
            return;

    __execute
        boolean aq;
        boolean rl;
        bits(5) rs1;
        word_width size;
        bits(5) rd;
        (aq, rl, rs1, size, rd) = (bool_bits_backwards(mapping0XH), bool_bits_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), size_enc_backwards(mapping3XH), encdec_reg_backwards(mapping4XH));
        - = execute_LOADRES(aq, rl, rs1, size, rd);

__instruction LOAD_FP_0
    __encoding LOAD_FP_0
        __instruction_set R64
        __field imm 20 +: 12
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx011xxxxx0000111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_freg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_D))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH));
        - = execute_LOAD_FP(imm, rs1, rd, DOUBLE);

__instruction LOAD_FP_1
    __encoding LOAD_FP_1
        __instruction_set R64
        __field imm 20 +: 12
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx010xxxxx0000111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_freg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_F))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH));
        - = execute_LOAD_FP(imm, rs1, rd, WORD);

__instruction LOAD_FP_2
    __encoding LOAD_FP_2
        __instruction_set R64
        __field imm 20 +: 12
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx001xxxxx0000111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_freg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zfhmin))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH));
        - = execute_LOAD_FP(imm, rs1, rd, HALF);

__instruction MASKTYPEI_0
    __encoding MASKTYPEI_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field simm 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '0101110xxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_MASKTYPEI(vs2, simm, vd);

__instruction MASKTYPEV_0
    __encoding MASKTYPEV_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0101110xxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_MASKTYPEV(vs2, vs1, vd);

__instruction MASKTYPEX_0
    __encoding MASKTYPEX_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0101110xxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (vs2, rs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_MASKTYPEX(vs2, rs1, vd);

__instruction MMTYPE_0
    __encoding MMTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxx1xxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_mmfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        mmfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_mmfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_MMTYPE(funct6, vs2, vs1, vd);

__instruction MOVETYPEI_0
    __encoding MOVETYPEI_0
        __instruction_set R64
        __field simm 15 +: 5
        __field mapping0XH 7 +: 5
        __opcode '010111100000xxxxx011xxxxx1010111'
        __guard and_bool(encdec_vreg_backwards_matches(mapping0XH), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        constant bits(5) vd = encdec_vreg_backwards(mapping0XH);
        - = execute_MOVETYPEI(vd, simm);

__instruction MOVETYPEV_0
    __encoding MOVETYPEV_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010111100000xxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs1;
        bits(5) vd;
        (vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_MOVETYPEV(vs1, vd);

__instruction MOVETYPEX_0
    __encoding MOVETYPEX_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010111100000xxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) vd;
        (rs1, vd) = (encdec_reg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_MOVETYPEX(rs1, vd);

__instruction MRET_0
    __encoding MRET_0
        __instruction_set R64
        __opcode '00110000001000000000000001110011'
        __guard TRUE
        __decode
            return;

    __execute
        - = execute_MRET();

__instruction MUL_0
    __encoding MUL_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode '0000001xxxxxxxxxxxxxxxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(encdec_mul_op_backwards_matches(mapping2XH), encdec_reg_backwards_matches(mapping3XH)))), or_bool(currentlyEnabled(Ext_M), currentlyEnabled(Ext_Zmmul)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        mul_op mul_opXN;
        bits(5) rd;
        (rs2, rs1, mul_opXN, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_mul_op_backwards(mapping2XH), encdec_reg_backwards(mapping3XH));
        - = execute_MUL(rs2, rs1, rd, mul_opXN);

__instruction MULW_0
    __encoding MULW_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000001xxxxxxxxxx000xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(eq_int(xlen, 64), or_bool(currentlyEnabled(Ext_M), currentlyEnabled(Ext_Zmmul))))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_MULW(rs2, rs1, rd);

__instruction MVVCOMPRESS_0
    __encoding MVVCOMPRESS_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0101111xxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_MVVCOMPRESS(vs2, vs1, vd);

__instruction MVVMATYPE_0
    __encoding MVVMATYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_mvvmafunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        mvvmafunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_mvvmafunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_MVVMATYPE(funct6, vm, vs2, vs1, vd);

__instruction MVVTYPE_0
    __encoding MVVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_mvvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        mvvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_mvvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_MVVTYPE(funct6, vm, vs2, vs1, vd);

__instruction MVXMATYPE_0
    __encoding MVXMATYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx110xxxxx1010111'
        __guard and_bool(and_bool(encdec_mvxmafunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        mvxmafunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_mvxmafunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_MVXMATYPE(funct6, vm, vs2, rs1, vd);

__instruction MVXTYPE_0
    __encoding MVXTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx110xxxxx1010111'
        __guard and_bool(and_bool(encdec_mvxfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        mvxfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_mvxfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_MVXTYPE(funct6, vm, vs2, rs1, vd);

__instruction NISTYPE_0
    __encoding NISTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field simm 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_nisfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        nisfunct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_nisfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_NISTYPE(funct6, vm, vs2, simm, vd);

__instruction NITYPE_0
    __encoding NITYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field simm 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_nifunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        nifunct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_nifunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_NITYPE(funct6, vm, vs2, simm, vd);

__instruction NVSTYPE_0
    __encoding NVSTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_nvsfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        nvsfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_nvsfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_NVSTYPE(funct6, vm, vs2, vs1, vd);

__instruction NVTYPE_0
    __encoding NVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_nvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        nvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_nvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_NVTYPE(funct6, vm, vs2, vs1, vd);

__instruction NXSTYPE_0
    __encoding NXSTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_nxsfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        nxsfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_nxsfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_NXSTYPE(funct6, vm, vs2, rs1, vd);

__instruction NXTYPE_0
    __encoding NXTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_nxfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        nxfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_nxfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_NXTYPE(funct6, vm, vs2, rs1, vd);

__instruction ORCB_0
    __encoding ORCB_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '001010000111xxxxx101xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zbb))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ORCB(rs1, rd);

__instruction REM_0
    __encoding REM_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 1
        __field mapping3XH 7 +: 5
        __opcode '0000001xxxxxxxxxx11xxxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(bool_not_bits_backwards_matches(mapping2XH), encdec_reg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_M))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        boolean s;
        bits(5) rd;
        (rs2, rs1, s, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), bool_not_bits_backwards(mapping2XH), encdec_reg_backwards(mapping3XH));
        - = execute_REM(rs2, rs1, rd, s);

__instruction REMW_0
    __encoding REMW_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 1
        __field mapping3XH 7 +: 5
        __opcode '0000001xxxxxxxxxx11xxxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(bool_not_bits_backwards_matches(mapping2XH), encdec_reg_backwards_matches(mapping3XH)))), and_bool(eq_int(xlen, 64), currentlyEnabled(Ext_M)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        boolean s;
        bits(5) rd;
        (rs2, rs1, s, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), bool_not_bits_backwards(mapping2XH), encdec_reg_backwards(mapping3XH));
        - = execute_REMW(rs2, rs1, rd, s);

__instruction REV8_0
    __encoding REV8_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011010111000xxxxx101xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_REV8(rs1, rd);

__instruction REV8_1
    __encoding REV8_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011010011000xxxxx101xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_REV8(rs1, rd);

__instruction RFVVTYPE_0
    __encoding RFVVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_rfvvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        rfvvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_rfvvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_RFVVTYPE(funct6, vm, vs2, vs1, vd);

__instruction RIVVTYPE_0
    __encoding RIVVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_rivvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        rivvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_rivvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_RIVVTYPE(funct6, vm, vs2, vs1, vd);

__instruction RMVVTYPE_0
    __encoding RMVVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_rmvvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        rmvvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_rmvvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_RMVVTYPE(funct6, vm, vs2, vs1, vd);

__instruction RORI_0
    __encoding RORI_0
        __instruction_set R64
        __field shamt 20 +: 6
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011000xxxxxxxxxxx101xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)), or_bool(eq_int(xlen, 64), eq_bit(bitvector_access(shamt, 5), '0'))))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_RORI(shamt, rs1, rd);

__instruction RORIW_0
    __encoding RORIW_0
        __instruction_set R64
        __field shamt 20 +: 5
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '0110000xxxxxxxxxx101xxxxx0011011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_RORIW(shamt, rs1, rd);

__instruction RTYPE_0
    __encoding RTYPE_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0100000xxxxxxxxxx101xxxxx0110011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPE(rs2, rs1, rd, SRA);

__instruction RTYPE_1
    __encoding RTYPE_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0100000xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPE(rs2, rs1, rd, SUB);

__instruction RTYPE_2
    __encoding RTYPE_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx101xxxxx0110011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPE(rs2, rs1, rd, SRL);

__instruction RTYPE_3
    __encoding RTYPE_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx001xxxxx0110011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPE(rs2, rs1, rd, SLL);

__instruction RTYPE_4
    __encoding RTYPE_4
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx100xxxxx0110011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPE(rs2, rs1, rd, XXOR);

__instruction RTYPE_5
    __encoding RTYPE_5
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx110xxxxx0110011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPE(rs2, rs1, rd, OR_XN);

__instruction RTYPE_6
    __encoding RTYPE_6
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx111xxxxx0110011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPE(rs2, rs1, rd, AND_XN);

__instruction RTYPE_7
    __encoding RTYPE_7
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx011xxxxx0110011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPE(rs2, rs1, rd, SLTU);

__instruction RTYPE_8
    __encoding RTYPE_8
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx010xxxxx0110011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPE(rs2, rs1, rd, SLT);

__instruction RTYPE_9
    __encoding RTYPE_9
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPE(rs2, rs1, rd, ADD);

__instruction RTYPEW_0
    __encoding RTYPEW_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0100000xxxxxxxxxx101xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), eq_int(xlen, 64))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPEW(rs2, rs1, rd, SRAW);

__instruction RTYPEW_1
    __encoding RTYPEW_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx101xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), eq_int(xlen, 64))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPEW(rs2, rs1, rd, SRLW);

__instruction RTYPEW_2
    __encoding RTYPEW_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx001xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), eq_int(xlen, 64))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPEW(rs2, rs1, rd, SLLW);

__instruction RTYPEW_3
    __encoding RTYPEW_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0100000xxxxxxxxxx000xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), eq_int(xlen, 64))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPEW(rs2, rs1, rd, SUBW);

__instruction RTYPEW_4
    __encoding RTYPEW_4
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000000xxxxxxxxxx000xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), eq_int(xlen, 64))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_RTYPEW(rs2, rs1, rd, ADDW);

__instruction SFENCE_INVAL_IR_0
    __encoding SFENCE_INVAL_IR_0
        __instruction_set R64
        __opcode '00011000000100000000000001110011'
        __guard currentlyEnabled(Ext_Svinval)
        __decode
            return;

    __execute
        - = execute_SFENCE_INVAL_IR();

__instruction SFENCE_VMA_0
    __encoding SFENCE_VMA_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __opcode '0001001xxxxxxxxxx000000001110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), or_bool(virtual_memory_supported(), not(TRUE)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        (rs2, rs1) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SFENCE_VMA(rs1, rs2);

__instruction SFENCE_W_INVAL_0
    __encoding SFENCE_W_INVAL_0
        __instruction_set R64
        __opcode '00011000000000000000000001110011'
        __guard currentlyEnabled(Ext_Svinval)
        __decode
            return;

    __execute
        - = execute_SFENCE_W_INVAL();

__instruction SHA256SIG0_0
    __encoding SHA256SIG0_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000100000010xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zknh))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHA256SIG0(rs1, rd);

__instruction SHA256SIG1_0
    __encoding SHA256SIG1_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000100000011xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zknh))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHA256SIG1(rs1, rd);

__instruction SHA256SUM0_0
    __encoding SHA256SUM0_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000100000000xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zknh))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHA256SUM0(rs1, rd);

__instruction SHA256SUM1_0
    __encoding SHA256SUM1_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000100000001xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zknh))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHA256SUM1(rs1, rd);

__instruction SHA512SIG0_0
    __encoding SHA512SIG0_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000100000110xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zknh), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHA512SIG0(rs1, rd);

__instruction SHA512SIG0H_0
    __encoding SHA512SIG0H_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0101110xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zknh), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_SHA512SIG0H(rs2, rs1, rd);

__instruction SHA512SIG0L_0
    __encoding SHA512SIG0L_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0101010xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zknh), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_SHA512SIG0L(rs2, rs1, rd);

__instruction SHA512SIG1_0
    __encoding SHA512SIG1_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000100000111xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zknh), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHA512SIG1(rs1, rd);

__instruction SHA512SIG1H_0
    __encoding SHA512SIG1H_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0101111xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zknh), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_SHA512SIG1H(rs2, rs1, rd);

__instruction SHA512SIG1L_0
    __encoding SHA512SIG1L_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0101011xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zknh), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_SHA512SIG1L(rs2, rs1, rd);

__instruction SHA512SUM0_0
    __encoding SHA512SUM0_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000100000100xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zknh), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHA512SUM0(rs1, rd);

__instruction SHA512SUM0R_0
    __encoding SHA512SUM0R_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0101000xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zknh), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_SHA512SUM0R(rs2, rs1, rd);

__instruction SHA512SUM1_0
    __encoding SHA512SUM1_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000100000101xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zknh), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHA512SUM1(rs1, rd);

__instruction SHA512SUM1R_0
    __encoding SHA512SUM1R_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0101001xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zknh), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_SHA512SUM1R(rs2, rs1, rd);

__instruction SHIFTIOP_0
    __encoding SHIFTIOP_0
        __instruction_set R64
        __field shamt 20 +: 6
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010000xxxxxxxxxxx101xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), or_bool(eq_int(xlen, 64), eq_bit(bitvector_access(shamt, 5), '0')))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHIFTIOP(shamt, rs1, rd, SRAI);

__instruction SHIFTIOP_1
    __encoding SHIFTIOP_1
        __instruction_set R64
        __field shamt 20 +: 6
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000000xxxxxxxxxxx101xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), or_bool(eq_int(xlen, 64), eq_bit(bitvector_access(shamt, 5), '0')))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHIFTIOP(shamt, rs1, rd, SRLI);

__instruction SHIFTIOP_2
    __encoding SHIFTIOP_2
        __instruction_set R64
        __field shamt 20 +: 6
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000000xxxxxxxxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), or_bool(eq_int(xlen, 64), eq_bit(bitvector_access(shamt, 5), '0')))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHIFTIOP(shamt, rs1, rd, SLLI);

__instruction SHIFTIWOP_0
    __encoding SHIFTIWOP_0
        __instruction_set R64
        __field shamt 20 +: 5
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '0100000xxxxxxxxxx101xxxxx0011011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), eq_int(xlen, 64))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHIFTIWOP(shamt, rs1, rd, SRAIW);

__instruction SHIFTIWOP_1
    __encoding SHIFTIWOP_1
        __instruction_set R64
        __field shamt 20 +: 5
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '0000000xxxxxxxxxx101xxxxx0011011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), eq_int(xlen, 64))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHIFTIWOP(shamt, rs1, rd, SRLIW);

__instruction SHIFTIWOP_2
    __encoding SHIFTIWOP_2
        __instruction_set R64
        __field shamt 20 +: 5
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '0000000xxxxxxxxxx001xxxxx0011011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), eq_int(xlen, 64))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SHIFTIWOP(shamt, rs1, rd, SLLIW);

__instruction SINVAL_VMA_0
    __encoding SINVAL_VMA_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __opcode '0001011xxxxxxxxxx000000001110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Svinval))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        (rs2, rs1) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SINVAL_VMA(rs1, rs2);

__instruction SLLIUW_0
    __encoding SLLIUW_0
        __instruction_set R64
        __field shamt 20 +: 6
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000010xxxxxxxxxxx001xxxxx0011011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zba), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SLLIUW(shamt, rs1, rd);

__instruction SM3P0_0
    __encoding SM3P0_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000100001000xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zksh))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SM3P0(rs1, rd);

__instruction SM3P1_0
    __encoding SM3P1_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000100001001xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zksh))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_SM3P1(rs1, rd);

__instruction SM4ED_0
    __encoding SM4ED_0
        __instruction_set R64
        __field bs 30 +: 2
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xx11000xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zksed))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_SM4ED(bs, rs2, rs1, rd);

__instruction SM4KS_0
    __encoding SM4KS_0
        __instruction_set R64
        __field bs 30 +: 2
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xx11010xxxxxxxxxx000xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zksed))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_SM4KS(bs, rs2, rs1, rd);

__instruction SRET_0
    __encoding SRET_0
        __instruction_set R64
        __opcode '00010000001000000000000001110011'
        __guard TRUE
        __decode
            return;

    __execute
        - = execute_SRET();

__instruction STORE_0
    __encoding STORE_0
        __instruction_set R64
        __field imm7 25 +: 7
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 2
        __field imm5 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx0xxxxxxx0100011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), size_enc_backwards_matches(mapping2XH))), lteq_int(size_bytes_forwards(size_enc_backwards(mapping2XH)), xlen_bytes))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        word_width width;
        (rs2, rs1, width) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), size_enc_backwards(mapping2XH));
        - = execute_STORE(bitvector_concat(imm7, imm5), rs2, rs1, width, FALSE, FALSE);

__instruction STORECON_0
    __encoding STORECON_0
        __instruction_set R64
        __field mapping0XH 26 +: 1
        __field mapping1XH 25 +: 1
        __field mapping2XH 20 +: 5
        __field mapping3XH 15 +: 5
        __field mapping4XH 12 +: 2
        __field mapping5XH 7 +: 5
        __opcode '00011xxxxxxxxxxxx0xxxxxxx0101111'
        __guard and_bool(and_bool(bool_bits_backwards_matches(mapping0XH), and_bool(bool_bits_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), and_bool(encdec_reg_backwards_matches(mapping3XH), and_bool(size_enc_backwards_matches(mapping4XH), encdec_reg_backwards_matches(mapping5XH)))))), and_bool(currentlyEnabled(Ext_Zalrsc), lrsc_width_valid(size_enc_backwards(mapping4XH))))
        __decode
            return;

    __execute
        boolean aq;
        boolean rl;
        bits(5) rs2;
        bits(5) rs1;
        word_width size;
        bits(5) rd;
        (aq, rl, rs2, rs1, size, rd) = (bool_bits_backwards(mapping0XH), bool_bits_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_reg_backwards(mapping3XH), size_enc_backwards(mapping4XH), encdec_reg_backwards(mapping5XH));
        - = execute_STORECON(aq, rl, rs2, rs1, size, rd);

__instruction STORE_FP_0
    __encoding STORE_FP_0
        __instruction_set R64
        __field imm7 25 +: 7
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field imm5 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx011xxxxx0100111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_D))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        (rs2, rs1) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_STORE_FP(bitvector_concat(imm7, imm5), rs2, rs1, DOUBLE);

__instruction STORE_FP_1
    __encoding STORE_FP_1
        __instruction_set R64
        __field imm7 25 +: 7
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field imm5 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx010xxxxx0100111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_F))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        (rs2, rs1) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_STORE_FP(bitvector_concat(imm7, imm5), rs2, rs1, WORD);

__instruction STORE_FP_2
    __encoding STORE_FP_2
        __instruction_set R64
        __field imm7 25 +: 7
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field imm5 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx001xxxxx0100111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zfhmin))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        (rs2, rs1) = (encdec_freg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_STORE_FP(bitvector_concat(imm7, imm5), rs2, rs1, HALF);

__instruction UNZIP_0
    __encoding UNZIP_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000010001111xxxxx101xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbkb), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_UNZIP(rs1, rd);

__instruction UTYPE_0
    __encoding UTYPE_0
        __instruction_set R64
        __field imm 12 +: 20
        __field mapping0XH 7 +: 5
        __field mapping1XH 0 +: 7
        __opcode 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_uop_backwards_matches(mapping1XH))
        __decode
            return;

    __execute
        bits(5) rd;
        uop op;
        (rd, op) = (encdec_reg_backwards(mapping0XH), encdec_uop_backwards(mapping1XH));
        - = execute_UTYPE(imm, rd, op);

__instruction VAESDF_0
    __encoding VAESDF_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxx1xxxxx00001010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vaesdf_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zvkned), and_bool(eq_int(get_sew(), 32), and_bool(zvk_check_encdec(128, 4), or_bool(encdec_vaesdf_backwards(mapping0XH) == ZVK_VAESDF_VV, zvk_valid_reg_overlap(encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), get_lmul_pow()))))))
        __decode
            return;

    __execute
        zvk_vaesdf_funct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_vaesdf_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VAESDF(funct6, vs2, vd);

__instruction VAESDM_0
    __encoding VAESDM_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxx1xxxxx00000010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vaesdm_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zvkned), and_bool(eq_int(get_sew(), 32), and_bool(zvk_check_encdec(128, 4), or_bool(encdec_vaesdm_backwards(mapping0XH) == ZVK_VAESDM_VV, zvk_valid_reg_overlap(encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), get_lmul_pow()))))))
        __decode
            return;

    __execute
        zvk_vaesdm_funct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_vaesdm_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VAESDM(funct6, vs2, vd);

__instruction VAESEF_0
    __encoding VAESEF_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxx1xxxxx00011010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vaesef_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zvkned), and_bool(eq_int(get_sew(), 32), and_bool(zvk_check_encdec(128, 4), or_bool(encdec_vaesef_backwards(mapping0XH) == ZVK_VAESEF_VV, zvk_valid_reg_overlap(encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), get_lmul_pow()))))))
        __decode
            return;

    __execute
        zvk_vaesef_funct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_vaesef_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VAESEF(funct6, vs2, vd);

__instruction VAESEM_0
    __encoding VAESEM_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxx1xxxxx00010010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vaesem_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zvkned), and_bool(eq_int(get_sew(), 32), and_bool(zvk_check_encdec(128, 4), or_bool(encdec_vaesem_backwards(mapping0XH) == ZVK_VAESEM_VV, zvk_valid_reg_overlap(encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), get_lmul_pow()))))))
        __decode
            return;

    __execute
        zvk_vaesem_funct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_vaesem_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VAESEM(funct6, vs2, vd);

__instruction VAESKF1_VI_0
    __encoding VAESKF1_VI_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field rnd 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '1000101xxxxxxxxxx010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zvkned), and_bool(eq_int(get_sew(), 32), zvk_check_encdec(128, 4))))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VAESKF1_VI(vs2, rnd, vd);

__instruction VAESKF2_VI_0
    __encoding VAESKF2_VI_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field rnd 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '1010101xxxxxxxxxx010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zvkned), and_bool(eq_int(get_sew(), 32), zvk_check_encdec(128, 4))))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VAESKF2_VI(vs2, rnd, vd);

__instruction VAESZ_VS_0
    __encoding VAESZ_VS_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '1010011xxxxx00111010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zvkned), and_bool(eq_int(get_sew(), 32), and_bool(zvk_check_encdec(128, 4), zvk_valid_reg_overlap(encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), get_lmul_pow())))))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VAESZ_VS(vs2, vd);

__instruction VANDN_VV_0
    __encoding VANDN_VV_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '000001xxxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zvkb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VANDN_VV(vm, vs1, vs2, vd);

__instruction VANDN_VX_0
    __encoding VANDN_VX_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '000001xxxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zvkb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (vs2, rs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VANDN_VX(vm, vs2, rs1, vd);

__instruction VBREV8_V_0
    __encoding VBREV8_V_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010010xxxxxx01000010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zvkb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VBREV8_V(vm, vs2, vd);

__instruction VBREV_V_0
    __encoding VBREV_V_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010010xxxxxx01010010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zvbb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VBREV_V(vm, vs2, vd);

__instruction VCLMULH_VV_0
    __encoding VCLMULH_VV_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '001101xxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zvbc), eq_int(get_sew(), 64)))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VCLMULH_VV(vm, vs2, vs1, vd);

__instruction VCLMULH_VX_0
    __encoding VCLMULH_VX_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '001101xxxxxxxxxxx110xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zvbc), eq_int(get_sew(), 64)))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (vs2, rs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VCLMULH_VX(vm, vs2, rs1, vd);

__instruction VCLMUL_VV_0
    __encoding VCLMUL_VV_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '001100xxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zvbc), eq_int(get_sew(), 64)))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VCLMUL_VV(vm, vs2, vs1, vd);

__instruction VCLMUL_VX_0
    __encoding VCLMUL_VX_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '001100xxxxxxxxxxx110xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zvbc), eq_int(get_sew(), 64)))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (vs2, rs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VCLMUL_VX(vm, vs2, rs1, vd);

__instruction VCLZ_V_0
    __encoding VCLZ_V_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010010xxxxxx01100010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zvbb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VCLZ_V(vm, vs2, vd);

__instruction VCPOP_M_0
    __encoding VCPOP_M_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010000xxxxxx10000010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rd;
        (vs2, rd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_VCPOP_M(vm, vs2, rd);

__instruction VCPOP_V_0
    __encoding VCPOP_V_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010010xxxxxx01110010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zvbb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VCPOP_V(vm, vs2, vd);

__instruction VCTZ_V_0
    __encoding VCTZ_V_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010010xxxxxx01101010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zvbb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VCTZ_V(vm, vs2, vd);

__instruction VEXT2TYPE_0
    __encoding VEXT2TYPE_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010010xxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(vext2_vs1_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        vext2funct6 funct6;
        bits(5) vd;
        (vs2, funct6, vd) = (encdec_vreg_backwards(mapping0XH), vext2_vs1_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VEXT2TYPE(funct6, vm, vs2, vd);

__instruction VEXT4TYPE_0
    __encoding VEXT4TYPE_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010010xxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(vext4_vs1_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        vext4funct6 funct6;
        bits(5) vd;
        (vs2, funct6, vd) = (encdec_vreg_backwards(mapping0XH), vext4_vs1_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VEXT4TYPE(funct6, vm, vs2, vd);

__instruction VEXT8TYPE_0
    __encoding VEXT8TYPE_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010010xxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(vext8_vs1_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        vext8funct6 funct6;
        bits(5) vd;
        (vs2, funct6, vd) = (encdec_vreg_backwards(mapping0XH), vext8_vs1_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VEXT8TYPE(funct6, vm, vs2, vd);

__instruction VFIRST_M_0
    __encoding VFIRST_M_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010000xxxxxx10001010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rd;
        (vs2, rd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_VFIRST_M(vm, vs2, rd);

__instruction VFMERGE_0
    __encoding VFMERGE_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0101110xxxxxxxxxx101xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_freg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (vs2, rs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VFMERGE(vs2, rs1, vd);

__instruction VFMV_0
    __encoding VFMV_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010111100000xxxxx101xxxxx1010111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) vd;
        (rs1, vd) = (encdec_freg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VFMV(rs1, vd);

__instruction VFMVFS_0
    __encoding VFMVFS_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '0100001xxxxx00000001xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_freg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rd;
        (vs2, rd) = (encdec_vreg_backwards(mapping0XH), encdec_freg_backwards(mapping1XH));
        - = execute_VFMVFS(vs2, rd);

__instruction VFMVSF_0
    __encoding VFMVSF_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010000100000xxxxx101xxxxx1010111'
        __guard and_bool(and_bool(encdec_freg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) vd;
        (rs1, vd) = (encdec_freg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VFMVSF(rs1, vd);

__instruction VFNUNARY0_0
    __encoding VFNUNARY0_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010010xxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vfnunary0_vs1_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        vfnunary0 vfnunary0XN;
        bits(5) vd;
        (vs2, vfnunary0XN, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vfnunary0_vs1_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VFNUNARY0(vm, vs2, vfnunary0XN, vd);

__instruction VFUNARY0_0
    __encoding VFUNARY0_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010010xxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vfunary0_vs1_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        vfunary0 vfunary0XN;
        bits(5) vd;
        (vs2, vfunary0XN, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vfunary0_vs1_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VFUNARY0(vm, vs2, vfunary0XN, vd);

__instruction VFUNARY1_0
    __encoding VFUNARY1_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010011xxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vfunary1_vs1_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        vfunary1 vfunary1XN;
        bits(5) vd;
        (vs2, vfunary1XN, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vfunary1_vs1_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VFUNARY1(vm, vs2, vfunary1XN, vd);

__instruction VFWUNARY0_0
    __encoding VFWUNARY0_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010010xxxxxxxxxxx001xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vfwunary0_vs1_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        vfwunary0 vfwunary0XN;
        bits(5) vd;
        (vs2, vfwunary0XN, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vfwunary0_vs1_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VFWUNARY0(vm, vs2, vfwunary0XN, vd);

__instruction VGHSH_VV_0
    __encoding VGHSH_VV_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1011001xxxxxxxxxx010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zvkg), and_bool(eq_int(get_sew(), 32), zvk_check_encdec(128, 4))))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VGHSH_VV(vs2, vs1, vd);

__instruction VGMUL_VV_0
    __encoding VGMUL_VV_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '1010001xxxxx10001010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zvkg), and_bool(eq_int(get_sew(), 32), zvk_check_encdec(128, 4))))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VGMUL_VV(vs2, vd);

__instruction VICMPTYPE_0
    __encoding VICMPTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field simm 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_vicmpfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vicmpfunct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_vicmpfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VICMPTYPE(funct6, vm, vs2, simm, vd);

__instruction VID_V_0
    __encoding VID_V_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 7 +: 5
        __opcode '010100x0000010001010xxxxx1010111'
        __guard and_bool(encdec_vreg_backwards_matches(mapping0XH), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        constant bits(5) vd = encdec_vreg_backwards(mapping0XH);
        - = execute_VID_V(vm, vd);

__instruction VIMCTYPE_0
    __encoding VIMCTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field simm 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxx1xxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_vimcfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vimcfunct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_vimcfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VIMCTYPE(funct6, vs2, simm, vd);

__instruction VIMSTYPE_0
    __encoding VIMSTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field simm 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxx0xxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_vimsfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vimsfunct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_vimsfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VIMSTYPE(funct6, vs2, simm, vd);

__instruction VIMTYPE_0
    __encoding VIMTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field simm 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxx0xxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_vimfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vimfunct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_vimfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VIMTYPE(funct6, vs2, simm, vd);

__instruction VIOTA_M_0
    __encoding VIOTA_M_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010100xxxxxx10000010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VIOTA_M(vm, vs2, vd);

__instruction VISG_0
    __encoding VISG_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field simm 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_visgfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        visgfunct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_visgfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VISG(funct6, vm, vs2, simm, vd);

__instruction VITYPE_0
    __encoding VITYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field simm 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_vifunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vifunct6 funct6;
        bits(5) vs2;
        bits(5) vd;
        (funct6, vs2, vd) = (encdec_vifunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VITYPE(funct6, vm, vs2, simm, vd);

__instruction VLOXSEGTYPE_0
    __encoding VLOXSEGTYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode 'xxx011xxxxxxxxxxxxxxxxxxx0000111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(encdec_vlewidth_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        vlewidth width;
        bits(5) vd;
        (vs2, rs1, width, vd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vlewidth_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VLOXSEGTYPE(nf, vm, vs2, rs1, width, vd);

__instruction VLRETYPE_0
    __encoding VLRETYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode 'xxx000101000xxxxxxxxxxxxx0000111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_vlewidth_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        vlewidth width;
        bits(5) vd;
        (rs1, width, vd) = (encdec_reg_backwards(mapping0XH), encdec_vlewidth_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VLRETYPE(nf, rs1, width, vd);

__instruction VLSEGFFTYPE_0
    __encoding VLSEGFFTYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field vm 25 +: 1
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode 'xxx000x10000xxxxxxxxxxxxx0000111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_vlewidth_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        vlewidth width;
        bits(5) vd;
        (rs1, width, vd) = (encdec_reg_backwards(mapping0XH), encdec_vlewidth_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VLSEGFFTYPE(nf, vm, rs1, width, vd);

__instruction VLSEGTYPE_0
    __encoding VLSEGTYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field vm 25 +: 1
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode 'xxx000x00000xxxxxxxxxxxxx0000111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_vlewidth_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        vlewidth width;
        bits(5) vd;
        (rs1, width, vd) = (encdec_reg_backwards(mapping0XH), encdec_vlewidth_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VLSEGTYPE(nf, vm, rs1, width, vd);

__instruction VLSSEGTYPE_0
    __encoding VLSSEGTYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode 'xxx010xxxxxxxxxxxxxxxxxxx0000111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(encdec_vlewidth_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        vlewidth width;
        bits(5) vd;
        (rs2, rs1, width, vd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vlewidth_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VLSSEGTYPE(nf, vm, rs2, rs1, width, vd);

__instruction VLUXSEGTYPE_0
    __encoding VLUXSEGTYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode 'xxx001xxxxxxxxxxxxxxxxxxx0000111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(encdec_vlewidth_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        vlewidth width;
        bits(5) vd;
        (vs2, rs1, width, vd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vlewidth_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VLUXSEGTYPE(nf, vm, vs2, rs1, width, vd);

__instruction VMSBF_M_0
    __encoding VMSBF_M_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010100xxxxxx00001010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VMSBF_M(vm, vs2, vd);

__instruction VMSIF_M_0
    __encoding VMSIF_M_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010100xxxxxx00011010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VMSIF_M(vm, vs2, vd);

__instruction VMSOF_M_0
    __encoding VMSOF_M_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010100xxxxxx00010010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VMSOF_M(vm, vs2, vd);

__instruction VMTYPE_0
    __encoding VMTYPE_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __field mapping2XH 0 +: 7
        __opcode '000000101011xxxxx000xxxxxxxxxxxx'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_lsop_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) vd_or_vs3;
        vmlsop op;
        (rs1, vd_or_vs3, op) = (encdec_reg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_lsop_backwards(mapping2XH));
        - = execute_VMTYPE(rs1, vd_or_vs3, op);

__instruction VMVRTYPE_0
    __encoding VMVRTYPE_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field simm 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '1001111xxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VMVRTYPE(vs2, simm, vd);

__instruction VMVSX_0
    __encoding VMVSX_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010000100000xxxxx110xxxxx1010111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) vd;
        (rs1, vd) = (encdec_reg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VMVSX(rs1, vd);

__instruction VMVXS_0
    __encoding VMVXS_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '0100001xxxxx00000010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rd;
        (vs2, rd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_VMVXS(vs2, rd);

__instruction VREV8_V_0
    __encoding VREV8_V_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010010xxxxxx01001010xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zvkb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VREV8_V(vm, vs2, vd);

__instruction VROL_VV_0
    __encoding VROL_VV_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010101xxxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zvkb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VROL_VV(vm, vs1, vs2, vd);

__instruction VROL_VX_0
    __encoding VROL_VX_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010101xxxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zvkb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (vs2, rs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VROL_VX(vm, vs2, rs1, vd);

__instruction VROR_VI_0
    __encoding VROR_VI_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field uimm 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010100xxxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zvkb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VROR_VI(vm, vs2, uimm, vd);

__instruction VROR_VV_0
    __encoding VROR_VV_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010100xxxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zvkb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VROR_VV(vm, vs1, vs2, vd);

__instruction VROR_VX_0
    __encoding VROR_VX_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '010100xxxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zvkb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (vs2, rs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VROR_VX(vm, vs2, rs1, vd);

__instruction VSETIVLI_0
    __encoding VSETIVLI_0
        __instruction_set R64
        __field ma 27 +: 1
        __field ta 26 +: 1
        __field sew 23 +: 3
        __field lmul 20 +: 3
        __field uimm 15 +: 5
        __field mapping0XH 7 +: 5
        __opcode '1100xxxxxxxxxxxxx111xxxxx1010111'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        constant bits(5) rd = encdec_reg_backwards(mapping0XH);
        - = execute_VSETIVLI(ma, ta, sew, lmul, uimm, rd);

__instruction VSETVL_0
    __encoding VSETVL_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1000000xxxxxxxxxx111xxxxx1010111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_VSETVL(rs2, rs1, rd);

__instruction VSETVLI_0
    __encoding VSETVLI_0
        __instruction_set R64
        __field ma 27 +: 1
        __field ta 26 +: 1
        __field sew 23 +: 3
        __field lmul 20 +: 3
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '0000xxxxxxxxxxxxx111xxxxx1010111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_VSETVLI(ma, ta, sew, lmul, rs1, rd);

__instruction VSHA2MS_VV_0
    __encoding VSHA2MS_VV_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1011011xxxxxxxxxx010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), or_bool(and_bool(currentlyEnabled(Ext_Zvknha), eq_int(get_sew(), 32)), and_bool(and_bool(currentlyEnabled(Ext_Zvknhb), or_bool(eq_int(get_sew(), 32), eq_int(get_sew(), 64))), zvknhab_check_encdec(encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH)))))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VSHA2MS_VV(vs2, vs1, vd);

__instruction VSM3C_VI_0
    __encoding VSM3C_VI_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field uimm 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '1010111xxxxxxxxxx010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zvksh), and_bool(eq_int(get_sew(), 32), and_bool(zvk_check_encdec(256, 8), zvk_valid_reg_overlap(encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), get_lmul_pow())))))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VSM3C_VI(vs2, uimm, vd);

__instruction VSM3ME_VV_0
    __encoding VSM3ME_VV_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1000001xxxxxxxxxx010xxxxx1110111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zvksh), and_bool(eq_int(get_sew(), 32), and_bool(zvk_check_encdec(256, 8), zvk_valid_reg_overlap(encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping2XH), get_lmul_pow())))))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VSM3ME_VV(vs2, vs1, vd);

__instruction VSOXSEGTYPE_0
    __encoding VSOXSEGTYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode 'xxx011xxxxxxxxxxxxxxxxxxx0100111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(encdec_vlewidth_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        vlewidth width;
        bits(5) vs3;
        (vs2, rs1, width, vs3) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vlewidth_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VSOXSEGTYPE(nf, vm, vs2, rs1, width, vs3);

__instruction VSRETYPE_0
    __encoding VSRETYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode 'xxx000101000xxxxx000xxxxx0100111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) vs3;
        (rs1, vs3) = (encdec_reg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VSRETYPE(nf, rs1, vs3);

__instruction VSSEGTYPE_0
    __encoding VSSEGTYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field vm 25 +: 1
        __field mapping0XH 15 +: 5
        __field mapping1XH 12 +: 3
        __field mapping2XH 7 +: 5
        __opcode 'xxx000x00000xxxxxxxxxxxxx0100111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_vlewidth_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs1;
        vlewidth width;
        bits(5) vs3;
        (rs1, width, vs3) = (encdec_reg_backwards(mapping0XH), encdec_vlewidth_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VSSEGTYPE(nf, vm, rs1, width, vs3);

__instruction VSSSEGTYPE_0
    __encoding VSSSEGTYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode 'xxx010xxxxxxxxxxxxxxxxxxx0100111'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(encdec_vlewidth_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        vlewidth width;
        bits(5) vs3;
        (rs2, rs1, width, vs3) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vlewidth_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VSSSEGTYPE(nf, vm, rs2, rs1, width, vs3);

__instruction VSUXSEGTYPE_0
    __encoding VSUXSEGTYPE_0
        __instruction_set R64
        __field nf 29 +: 3
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 12 +: 3
        __field mapping3XH 7 +: 5
        __opcode 'xxx001xxxxxxxxxxxxxxxxxxx0100111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), and_bool(encdec_vlewidth_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        vlewidth width;
        bits(5) vs3;
        (vs2, rs1, width, vs3) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vlewidth_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VSUXSEGTYPE(nf, vm, vs2, rs1, width, vs3);

__instruction VVCMPTYPE_0
    __encoding VVCMPTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vvcmpfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vvcmpfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_vvcmpfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VVCMPTYPE(funct6, vm, vs2, vs1, vd);

__instruction VVMCTYPE_0
    __encoding VVMCTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxx1xxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vvmcfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vvmcfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_vvmcfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VVMCTYPE(funct6, vs2, vs1, vd);

__instruction VVMSTYPE_0
    __encoding VVMSTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxx0xxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vvmsfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vvmsfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_vvmsfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VVMSTYPE(funct6, vs2, vs1, vd);

__instruction VVMTYPE_0
    __encoding VVMTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxx0xxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vvmfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vvmfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_vvmfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VVMTYPE(funct6, vs2, vs1, vd);

__instruction VVTYPE_0
    __encoding VVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_vvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VVTYPE(funct6, vm, vs2, vs1, vd);

__instruction VWSLL_VI_0
    __encoding VWSLL_VI_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field uimm 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '110101xxxxxxxxxxx011xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), encdec_vreg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zvbb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vd;
        (vs2, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH));
        - = execute_VWSLL_VI(vm, vs2, uimm, vd);

__instruction VWSLL_VV_0
    __encoding VWSLL_VV_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '110101xxxxxxxxxxx000xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zvbb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (vs2, vs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VWSLL_VV(vm, vs2, vs1, vd);

__instruction VWSLL_VX_0
    __encoding VWSLL_VX_0
        __instruction_set R64
        __field vm 25 +: 1
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '110101xxxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vreg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_vreg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zvbb))
        __decode
            return;

    __execute
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (vs2, rs1, vd) = (encdec_vreg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH));
        - = execute_VWSLL_VX(vm, vs2, rs1, vd);

__instruction VXCMPTYPE_0
    __encoding VXCMPTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vxcmpfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vxcmpfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_vxcmpfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VXCMPTYPE(funct6, vm, vs2, rs1, vd);

__instruction VXMCTYPE_0
    __encoding VXMCTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxx1xxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vxmcfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vxmcfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_vxmcfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VXMCTYPE(funct6, vs2, rs1, vd);

__instruction VXMSTYPE_0
    __encoding VXMSTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxx0xxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vxmsfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vxmsfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_vxmsfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VXMSTYPE(funct6, vs2, rs1, vd);

__instruction VXMTYPE_0
    __encoding VXMTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxx0xxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vxmfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vxmfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_vxmfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VXMTYPE(funct6, vs2, rs1, vd);

__instruction VXSG_0
    __encoding VXSG_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vxsgfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vxsgfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_vxsgfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VXSG(funct6, vm, vs2, rs1, vd);

__instruction VXTYPE_0
    __encoding VXTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx100xxxxx1010111'
        __guard and_bool(and_bool(encdec_vxfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        vxfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_vxfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_VXTYPE(funct6, vm, vs2, rs1, vd);

__instruction WFI_0
    __encoding WFI_0
        __instruction_set R64
        __opcode '00010000010100000000000001110011'
        __guard TRUE
        __decode
            return;

    __execute
        - = execute_WFI();

__instruction WMVVTYPE_0
    __encoding WMVVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_wmvvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        wmvvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_wmvvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_WMVVTYPE(funct6, vm, vs2, vs1, vd);

__instruction WMVXTYPE_0
    __encoding WMVXTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx110xxxxx1010111'
        __guard and_bool(and_bool(encdec_wmvxfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        wmvxfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_wmvxfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_WMVXTYPE(funct6, vm, vs2, rs1, vd);

__instruction WRS_0
    __encoding WRS_0
        __instruction_set R64
        __field mapping0XH 20 +: 12
        __opcode 'xxxxxxxxxxxx00000000000001110011'
        __guard and_bool(encdec_wrsop_backwards_matches(mapping0XH), currentlyEnabled(Ext_Zawrs))
        __decode
            return;

    __execute
        constant wrsop op = encdec_wrsop_backwards(mapping0XH);
        - = execute_WRS(op);

__instruction WVTYPE_0
    __encoding WVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_wvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        wvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_wvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_WVTYPE(funct6, vm, vs2, vs1, vd);

__instruction WVVTYPE_0
    __encoding WVVTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx010xxxxx1010111'
        __guard and_bool(and_bool(encdec_wvvfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        wvvfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_wvvfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_WVVTYPE(funct6, vm, vs2, vs1, vd);

__instruction WVXTYPE_0
    __encoding WVXTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx110xxxxx1010111'
        __guard and_bool(and_bool(encdec_wvxfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        wvxfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_wvxfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_WVXTYPE(funct6, vm, vs2, rs1, vd);

__instruction WXTYPE_0
    __encoding WXTYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field vm 25 +: 1
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx110xxxxx1010111'
        __guard and_bool(and_bool(encdec_wxfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_reg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), currentlyEnabled(Ext_V))
        __decode
            return;

    __execute
        wxfunct6 funct6;
        bits(5) vs2;
        bits(5) rs1;
        bits(5) vd;
        (funct6, vs2, rs1, vd) = (encdec_wxfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_WXTYPE(funct6, vm, vs2, rs1, vd);

__instruction XPERM4_0
    __encoding XPERM4_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010100xxxxxxxxxx010xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbkx))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_XPERM4(rs2, rs1, rd);

__instruction XPERM8_0
    __encoding XPERM8_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010100xxxxxxxxxx100xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbkx))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_XPERM8(rs2, rs1, rd);

__instruction ZBA_RTYPE_0
    __encoding ZBA_RTYPE_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010000xxxxxxxxxx110xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zba))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBA_RTYPE(rs2, rs1, rd, SH3ADD);

__instruction ZBA_RTYPE_1
    __encoding ZBA_RTYPE_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010000xxxxxxxxxx100xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zba))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBA_RTYPE(rs2, rs1, rd, SH2ADD);

__instruction ZBA_RTYPE_2
    __encoding ZBA_RTYPE_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010000xxxxxxxxxx010xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zba))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBA_RTYPE(rs2, rs1, rd, SH1ADD);

__instruction ZBA_RTYPEUW_0
    __encoding ZBA_RTYPEUW_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010000xxxxxxxxxx110xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zba), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBA_RTYPEUW(rs2, rs1, rd, SH3ADDUW);

__instruction ZBA_RTYPEUW_1
    __encoding ZBA_RTYPEUW_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010000xxxxxxxxxx100xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zba), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBA_RTYPEUW(rs2, rs1, rd, SH2ADDUW);

__instruction ZBA_RTYPEUW_2
    __encoding ZBA_RTYPEUW_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010000xxxxxxxxxx010xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zba), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBA_RTYPEUW(rs2, rs1, rd, SH1ADDUW);

__instruction ZBA_RTYPEUW_3
    __encoding ZBA_RTYPEUW_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000100xxxxxxxxxx000xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zba), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBA_RTYPEUW(rs2, rs1, rd, ADDUW);

__instruction ZBB_EXTOP_0
    __encoding ZBB_EXTOP_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000010000000xxxxx100xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbb), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZBB_EXTOP(rs1, rd, ZEXXTH);

__instruction ZBB_EXTOP_1
    __encoding ZBB_EXTOP_1
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000010000000xxxxx100xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbb), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZBB_EXTOP(rs1, rd, ZEXXTH);

__instruction ZBB_EXTOP_2
    __encoding ZBB_EXTOP_2
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011000000101xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zbb))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZBB_EXTOP(rs1, rd, SEXXTH);

__instruction ZBB_EXTOP_3
    __encoding ZBB_EXTOP_3
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011000000100xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zbb))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZBB_EXTOP(rs1, rd, SEXXTB);

__instruction ZBB_RTYPE_0
    __encoding ZBB_RTYPE_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0110000xxxxxxxxxx101xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPE(rs2, rs1, rd, ROR);

__instruction ZBB_RTYPE_1
    __encoding ZBB_RTYPE_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0110000xxxxxxxxxx001xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPE(rs2, rs1, rd, ROL);

__instruction ZBB_RTYPE_2
    __encoding ZBB_RTYPE_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000101xxxxxxxxxx101xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbb))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPE(rs2, rs1, rd, MINU);

__instruction ZBB_RTYPE_3
    __encoding ZBB_RTYPE_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000101xxxxxxxxxx100xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbb))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPE(rs2, rs1, rd, MIN);

__instruction ZBB_RTYPE_4
    __encoding ZBB_RTYPE_4
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000101xxxxxxxxxx111xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbb))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPE(rs2, rs1, rd, MAXXU);

__instruction ZBB_RTYPE_5
    __encoding ZBB_RTYPE_5
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000101xxxxxxxxxx110xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbb))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPE(rs2, rs1, rd, MAXX);

__instruction ZBB_RTYPE_6
    __encoding ZBB_RTYPE_6
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0100000xxxxxxxxxx100xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPE(rs2, rs1, rd, XXNOR);

__instruction ZBB_RTYPE_7
    __encoding ZBB_RTYPE_7
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0100000xxxxxxxxxx110xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPE(rs2, rs1, rd, ORN);

__instruction ZBB_RTYPE_8
    __encoding ZBB_RTYPE_8
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0100000xxxxxxxxxx111xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPE(rs2, rs1, rd, ANDN);

__instruction ZBB_RTYPEW_0
    __encoding ZBB_RTYPEW_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0110000xxxxxxxxxx101xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPEW(rs2, rs1, rd, RORW);

__instruction ZBB_RTYPEW_1
    __encoding ZBB_RTYPEW_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0110000xxxxxxxxxx001xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(or_bool(currentlyEnabled(Ext_Zbb), currentlyEnabled(Ext_Zbkb)), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBB_RTYPEW(rs2, rs1, rd, ROLW);

__instruction ZBKB_PACKW_0
    __encoding ZBKB_PACKW_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000100xxxxxxxxxx100xxxxx0111011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), and_bool(currentlyEnabled(Ext_Zbkb), eq_int(xlen, 64)))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBKB_PACKW(rs2, rs1, rd);

__instruction ZBKB_RTYPE_0
    __encoding ZBKB_RTYPE_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000100xxxxxxxxxx111xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbkb))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBKB_RTYPE(rs2, rs1, rd, PACKH);

__instruction ZBKB_RTYPE_1
    __encoding ZBKB_RTYPE_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000100xxxxxxxxxx100xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbkb))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBKB_RTYPE(rs2, rs1, rd, PACK);

__instruction ZBS_IOP_0
    __encoding ZBS_IOP_0
        __instruction_set R64
        __field shamt 20 +: 6
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '001010xxxxxxxxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbs), or_bool(eq_int(xlen, 64), eq_bit(bitvector_access(shamt, 5), '0'))))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZBS_IOP(shamt, rs1, rd, BSETI);

__instruction ZBS_IOP_1
    __encoding ZBS_IOP_1
        __instruction_set R64
        __field shamt 20 +: 6
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '011010xxxxxxxxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbs), or_bool(eq_int(xlen, 64), eq_bit(bitvector_access(shamt, 5), '0'))))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZBS_IOP(shamt, rs1, rd, BINVI);

__instruction ZBS_IOP_2
    __encoding ZBS_IOP_2
        __instruction_set R64
        __field shamt 20 +: 6
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010010xxxxxxxxxxx101xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbs), or_bool(eq_int(xlen, 64), eq_bit(bitvector_access(shamt, 5), '0'))))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZBS_IOP(shamt, rs1, rd, BEXXTI);

__instruction ZBS_IOP_3
    __encoding ZBS_IOP_3
        __instruction_set R64
        __field shamt 20 +: 6
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '010010xxxxxxxxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbs), or_bool(eq_int(xlen, 64), eq_bit(bitvector_access(shamt, 5), '0'))))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZBS_IOP(shamt, rs1, rd, BCLRI);

__instruction ZBS_RTYPE_0
    __encoding ZBS_RTYPE_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0010100xxxxxxxxxx001xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbs))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBS_RTYPE(rs2, rs1, rd, BSET);

__instruction ZBS_RTYPE_1
    __encoding ZBS_RTYPE_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0110100xxxxxxxxxx001xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbs))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBS_RTYPE(rs2, rs1, rd, BINV);

__instruction ZBS_RTYPE_2
    __encoding ZBS_RTYPE_2
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0100100xxxxxxxxxx101xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbs))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBS_RTYPE(rs2, rs1, rd, BEXXT);

__instruction ZBS_RTYPE_3
    __encoding ZBS_RTYPE_3
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0100100xxxxxxxxxx001xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zbs))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZBS_RTYPE(rs2, rs1, rd, BCLR);

__instruction ZICBOM_0
    __encoding ZICBOM_0
        __instruction_set R64
        __field mapping0XH 20 +: 12
        __field mapping1XH 15 +: 5
        __opcode 'xxxxxxxxxxxxxxxxx010000000001111'
        __guard and_bool(and_bool(encdec_cbop_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zicbom))
        __decode
            return;

    __execute
        cbop_zicbom cbop;
        bits(5) rs1;
        (cbop, rs1) = (encdec_cbop_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZICBOM(cbop, rs1);

__instruction ZICBOZ_0
    __encoding ZICBOZ_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __opcode '000000000100xxxxx010000000001111'
        __guard and_bool(encdec_reg_backwards_matches(mapping0XH), currentlyEnabled(Ext_Zicboz))
        __decode
            return;

    __execute
        constant bits(5) rs1 = encdec_reg_backwards(mapping0XH);
        - = execute_ZICBOZ(rs1);

__instruction ZICOND_RTYPE_0
    __encoding ZICOND_RTYPE_0
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000111xxxxxxxxxx111xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zicond))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZICOND_RTYPE(rs2, rs1, rd, CZERO_NEZ);

__instruction ZICOND_RTYPE_1
    __encoding ZICOND_RTYPE_1
        __instruction_set R64
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '0000111xxxxxxxxxx101xxxxx0110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zicond))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZICOND_RTYPE(rs2, rs1, rd, CZERO_EQZ);

__instruction ZIMOP_MOP_R_0
    __encoding ZIMOP_MOP_R_0
        __instruction_set R64
        __field mop_30 30 +: 1
        __field mop_27_26 26 +: 2
        __field mop_21_20 20 +: 2
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '1x00xx0111xxxxxxx100xxxxx1110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), currentlyEnabled(Ext_Zimop))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZIMOP_MOP_R(bitvector_concat(mop_30, bitvector_concat(mop_27_26, mop_21_20)), rs1, rd);

__instruction ZIMOP_MOP_RR_0
    __encoding ZIMOP_MOP_RR_0
        __instruction_set R64
        __field mop_30 30 +: 1
        __field mop_27_26 26 +: 2
        __field mapping0XH 20 +: 5
        __field mapping1XH 15 +: 5
        __field mapping2XH 7 +: 5
        __opcode '1x00xx1xxxxxxxxxx100xxxxx1110011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), and_bool(encdec_reg_backwards_matches(mapping1XH), encdec_reg_backwards_matches(mapping2XH))), currentlyEnabled(Ext_Zimop))
        __decode
            return;

    __execute
        bits(5) rs2;
        bits(5) rs1;
        bits(5) rd;
        (rs2, rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH), encdec_reg_backwards(mapping2XH));
        - = execute_ZIMOP_MOP_RR(bitvector_concat(mop_30, mop_27_26), rs2, rs1, rd);

__instruction ZIP_0
    __encoding ZIP_0
        __instruction_set R64
        __field mapping0XH 15 +: 5
        __field mapping1XH 7 +: 5
        __opcode '000010001111xxxxx001xxxxx0010011'
        __guard and_bool(and_bool(encdec_reg_backwards_matches(mapping0XH), encdec_reg_backwards_matches(mapping1XH)), and_bool(currentlyEnabled(Ext_Zbkb), eq_int(xlen, 32)))
        __decode
            return;

    __execute
        bits(5) rs1;
        bits(5) rd;
        (rs1, rd) = (encdec_reg_backwards(mapping0XH), encdec_reg_backwards(mapping1XH));
        - = execute_ZIP(rs1, rd);

__instruction ZVKSHA2TYPE_0
    __encoding ZVKSHA2TYPE_0
        __instruction_set R64
        __field mapping0XH 26 +: 6
        __field mapping1XH 20 +: 5
        __field mapping2XH 15 +: 5
        __field mapping3XH 7 +: 5
        __opcode 'xxxxxx1xxxxxxxxxx010xxxxx1110111'
        __guard and_bool(and_bool(encdec_zvkfunct6_backwards_matches(mapping0XH), and_bool(encdec_vreg_backwards_matches(mapping1XH), and_bool(encdec_vreg_backwards_matches(mapping2XH), encdec_vreg_backwards_matches(mapping3XH)))), or_bool(and_bool(currentlyEnabled(Ext_Zvknha), eq_int(get_sew(), 32)), and_bool(and_bool(currentlyEnabled(Ext_Zvknhb), or_bool(eq_int(get_sew(), 32), eq_int(get_sew(), 64))), zvknhab_check_encdec(encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH)))))
        __decode
            return;

    __execute
        zvkfunct6 funct6;
        bits(5) vs2;
        bits(5) vs1;
        bits(5) vd;
        (funct6, vs2, vs1, vd) = (encdec_zvkfunct6_backwards(mapping0XH), encdec_vreg_backwards(mapping1XH), encdec_vreg_backwards(mapping2XH), encdec_vreg_backwards(mapping3XH));
        - = execute_ZVKSHA2TYPE(funct6, vs2, vs1, vd);
