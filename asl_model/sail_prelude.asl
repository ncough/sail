///////////////////////////////////////////////////////////////////////////////////////////////////
// Prims from ARMv8 Model
///////////////////////////////////////////////////////////////////////////////////////////////////

bits(N) sdiv_bits(bits(N) x, bits(N) y)
    integer xn = SInt(x);
    integer yn = SInt(y);
    return RoundTowardsZero(Real(xn) / Real (yn))[N-1:0];

bits(N) LSL(bits(N) x, integer shift)
    assert shift >= 0;
    if shift == 0 then
        result = x;
    else
        extended_x = x : Zeros(shift);
        result = extended_x[N-1:0];
    return result;

bits(N) LSR(bits(N) x, integer shift)
    assert shift >= 0;
    if shift == 0 then
        result = x;
    else
        extended_x = Zeros(shift) : x;
        result = extended_x[shift+N-1:shift];
    return result;

bits(N1) lsr_bits(bits(N1) x, bits(N2) y)
    integer yn = SInt(y);
    return LSR(x, yn);

bits(N1) lsl_bits(bits(N1) x, bits(N2) y)
    integer yn = SInt(y);
    return LSL(x, yn);

// These should really be prim ops
integer HighestSetBit(bits(N) x)
    assert 0 < N && N <= 64;
    if (63 < N && x[63] == '1') then
        return 63;
    elsif (62 < N && x[62] == '1') then
        return 62;
    elsif (61 < N && x[61] == '1') then
        return 61;
    elsif (60 < N && x[60] == '1') then
        return 60;
    elsif (59 < N && x[59] == '1') then
        return 59;
    elsif (58 < N && x[58] == '1') then
        return 58;
    elsif (57 < N && x[57] == '1') then
        return 57;
    elsif (56 < N && x[56] == '1') then
        return 56;
    elsif (55 < N && x[55] == '1') then
        return 55;
    elsif (54 < N && x[54] == '1') then
        return 54;
    elsif (53 < N && x[53] == '1') then
        return 53;
    elsif (52 < N && x[52] == '1') then
        return 52;
    elsif (51 < N && x[51] == '1') then
        return 51;
    elsif (50 < N && x[50] == '1') then
        return 50;
    elsif (49 < N && x[49] == '1') then
        return 49;
    elsif (48 < N && x[48] == '1') then
        return 48;
    elsif (47 < N && x[47] == '1') then
        return 47;
    elsif (46 < N && x[46] == '1') then
        return 46;
    elsif (45 < N && x[45] == '1') then
        return 45;
    elsif (44 < N && x[44] == '1') then
        return 44;
    elsif (43 < N && x[43] == '1') then
        return 43;
    elsif (42 < N && x[42] == '1') then
        return 42;
    elsif (41 < N && x[41] == '1') then
        return 41;
    elsif (40 < N && x[40] == '1') then
        return 40;
    elsif (39 < N && x[39] == '1') then
        return 39;
    elsif (38 < N && x[38] == '1') then
        return 38;
    elsif (37 < N && x[37] == '1') then
        return 37;
    elsif (36 < N && x[36] == '1') then
        return 36;
    elsif (35 < N && x[35] == '1') then
        return 35;
    elsif (34 < N && x[34] == '1') then
        return 34;
    elsif (33 < N && x[33] == '1') then
        return 33;
    elsif (32 < N && x[32] == '1') then
        return 32;
    elsif (31 < N && x[31] == '1') then
        return 31;
    elsif (30 < N && x[30] == '1') then
        return 30;
    elsif (29 < N && x[29] == '1') then
        return 29;
    elsif (28 < N && x[28] == '1') then
        return 28;
    elsif (27 < N && x[27] == '1') then
        return 27;
    elsif (26 < N && x[26] == '1') then
        return 26;
    elsif (25 < N && x[25] == '1') then
        return 25;
    elsif (24 < N && x[24] == '1') then
        return 24;
    elsif (23 < N && x[23] == '1') then
        return 23;
    elsif (22 < N && x[22] == '1') then
        return 22;
    elsif (21 < N && x[21] == '1') then
        return 21;
    elsif (20 < N && x[20] == '1') then
        return 20;
    elsif (19 < N && x[19] == '1') then
        return 19;
    elsif (18 < N && x[18] == '1') then
        return 18;
    elsif (17 < N && x[17] == '1') then
        return 17;
    elsif (16 < N && x[16] == '1') then
        return 16;
    elsif (15 < N && x[15] == '1') then
        return 15;
    elsif (14 < N && x[14] == '1') then
        return 14;
    elsif (13 < N && x[13] == '1') then
        return 13;
    elsif (12 < N && x[12] == '1') then
        return 12;
    elsif (11 < N && x[11] == '1') then
        return 11;
    elsif (10 < N && x[10] == '1') then
        return 10;
    elsif (9 < N && x[9] == '1') then
        return 9;
    elsif (8 < N && x[8] == '1') then
        return 8;
    elsif (7 < N && x[7] == '1') then
        return 7;
    elsif (6 < N && x[6] == '1') then
        return 6;
    elsif (5 < N && x[5] == '1') then
        return 5;
    elsif (4 < N && x[4] == '1') then
        return 4;
    elsif (3 < N && x[3] == '1') then
        return 3;
    elsif (2 < N && x[2] == '1') then
        return 2;
    elsif (1 < N && x[1] == '1') then
        return 1;
    elsif (0 < N && x[0] == '1') then
        return 0;
    else
        return -1;

integer LowestSetBit(bits(N) x)
    assert 0 < N && N <= 64;
    if (0 < N && x[0] == '1') then
        return 0;
    elsif (1 < N && x[1] == '1') then
        return 1;
    elsif (2 < N && x[2] == '1') then
        return 2;
    elsif (3 < N && x[3] == '1') then
        return 3;
    elsif (4 < N && x[4] == '1') then
        return 4;
    elsif (5 < N && x[5] == '1') then
        return 5;
    elsif (6 < N && x[6] == '1') then
        return 6;
    elsif (7 < N && x[7] == '1') then
        return 7;
    elsif (8 < N && x[8] == '1') then
        return 8;
    elsif (9 < N && x[9] == '1') then
        return 9;
    elsif (10 < N && x[10] == '1') then
        return 10;
    elsif (11 < N && x[11] == '1') then
        return 11;
    elsif (12 < N && x[12] == '1') then
        return 12;
    elsif (13 < N && x[13] == '1') then
        return 13;
    elsif (14 < N && x[14] == '1') then
        return 14;
    elsif (15 < N && x[15] == '1') then
        return 15;
    elsif (16 < N && x[16] == '1') then
        return 16;
    elsif (17 < N && x[17] == '1') then
        return 17;
    elsif (18 < N && x[18] == '1') then
        return 18;
    elsif (19 < N && x[19] == '1') then
        return 19;
    elsif (20 < N && x[20] == '1') then
        return 20;
    elsif (21 < N && x[21] == '1') then
        return 21;
    elsif (22 < N && x[22] == '1') then
        return 22;
    elsif (23 < N && x[23] == '1') then
        return 23;
    elsif (24 < N && x[24] == '1') then
        return 24;
    elsif (25 < N && x[25] == '1') then
        return 25;
    elsif (26 < N && x[26] == '1') then
        return 26;
    elsif (27 < N && x[27] == '1') then
        return 27;
    elsif (28 < N && x[28] == '1') then
        return 28;
    elsif (29 < N && x[29] == '1') then
        return 29;
    elsif (30 < N && x[30] == '1') then
        return 30;
    elsif (31 < N && x[31] == '1') then
        return 31;
    elsif (32 < N && x[32] == '1') then
        return 32;
    elsif (33 < N && x[33] == '1') then
        return 33;
    elsif (34 < N && x[34] == '1') then
        return 34;
    elsif (35 < N && x[35] == '1') then
        return 35;
    elsif (36 < N && x[36] == '1') then
        return 36;
    elsif (37 < N && x[37] == '1') then
        return 37;
    elsif (38 < N && x[38] == '1') then
        return 38;
    elsif (39 < N && x[39] == '1') then
        return 39;
    elsif (40 < N && x[40] == '1') then
        return 40;
    elsif (41 < N && x[41] == '1') then
        return 41;
    elsif (42 < N && x[42] == '1') then
        return 42;
    elsif (43 < N && x[43] == '1') then
        return 43;
    elsif (44 < N && x[44] == '1') then
        return 44;
    elsif (45 < N && x[45] == '1') then
        return 45;
    elsif (46 < N && x[46] == '1') then
        return 46;
    elsif (47 < N && x[47] == '1') then
        return 47;
    elsif (48 < N && x[48] == '1') then
        return 48;
    elsif (49 < N && x[49] == '1') then
        return 49;
    elsif (50 < N && x[50] == '1') then
        return 50;
    elsif (51 < N && x[51] == '1') then
        return 51;
    elsif (52 < N && x[52] == '1') then
        return 52;
    elsif (53 < N && x[53] == '1') then
        return 53;
    elsif (54 < N && x[54] == '1') then
        return 54;
    elsif (55 < N && x[55] == '1') then
        return 55;
    elsif (56 < N && x[56] == '1') then
        return 56;
    elsif (57 < N && x[57] == '1') then
        return 57;
    elsif (58 < N && x[58] == '1') then
        return 58;
    elsif (59 < N && x[59] == '1') then
        return 59;
    elsif (60 < N && x[60] == '1') then
        return 60;
    elsif (61 < N && x[61] == '1') then
        return 61;
    elsif (62 < N && x[62] == '1') then
        return 62;
    elsif (63 < N && x[63] == '1') then
        return 63;
    else
        return N;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Integer Operations
///////////////////////////////////////////////////////////////////////////////////////////////////

type nat = integer;

boolean lteq_int(integer a, integer b)
    return a <= b;

boolean gteq_int(integer a, integer b)
    return a >= b;

integer min_int(integer a, integer b)
    return if a < b then a else b;

integer max_int(integer a, integer b)
    return if a > b then a else b;

integer quot_positive_round_zero(integer a, integer b)
    assert (a >= 0 && b > 0);
    return a QUOT b;

integer quot_round_zero(integer a, integer b)
    return a QUOT b;

integer rem_round_zero(integer a, integer b)
    return a REM b;

integer emod_int(integer a, integer b)
    constant integer r = a REM b;
    return (if r >= 0 then r elsif b > 0 then r + b else r - b);

///////////////////////////////////////////////////////////////////////////////////////////////////
// Bitvector Operations
///////////////////////////////////////////////////////////////////////////////////////////////////

integer signed(bits(n) a)
    return SInt(a);

integer unsigned(bits(n) a)
    return UInt(a);

bits(m) sail_sign_extend(bits(n) v, integer m)
    return SignExtend(v, m);

bits(m) sail_zero_extend(bits(n) v, integer m)
    return ZeroExtend(v, m);

bits(m) zero_extend(integer m, bits(n) v)
    return ZeroExtend(v, m);

bits(n) sail_zeros(integer n)
    return zeros_bits();

// Used in a constant definition, must be in an earlier file to ensure loaded before constant eval
bits(n) zeros(integer n)
    return zeros_bits();

bits(w) get_slice_int(integer w, integer n, integer lo)
    return n[lo +: w];

bits(l) to_bits(integer l, integer n)
    return get_slice_int(l, n, 0);

bits(wd) slice(bits(m) b, integer lo, integer wd)
    return b[lo +: wd];

bits(hi - lo + 1) subrange_bits(bits(m) b, integer hi, integer lo)
    return b[hi:lo];

bits(m) update_subrange_bits(bits(m) b, integer hi, integer lo, bits(hi - lo + 1) arg)
    b[hi:lo] = arg;
    return b;

bits(wd) truncate(bits(n) b, integer wd)
    return b[0 +: wd];

bits(1) bitvector_access(bits(m) b, integer pos)
    return b[pos];

bits(m) bitvector_update(bits(m) b, integer pos, bits(1) p)
    b[pos] = p;
    return b;

bits(m+n) bitvector_concat(bits(m) a, bits(n) b)
    return a:b;

boolean eq_bit(bit a, bit b)
    return eq_bits(a, b);

boolean ugt_bits(bits(m) a, bits(m) b)
    return UInt(a) > UInt(b);

boolean uge_bits(bits(m) a, bits(m) b)
    return UInt(a) >= UInt(b);

boolean ult_bits(bits(m) a, bits(m) b)
    return UInt(a) < UInt(b);

boolean ule_bits(bits(m) a, bits(m) b)
    return UInt(a) <= UInt(b);

boolean sgt_bits(bits(m) a, bits(m) b)
    return SInt(a) > SInt(b);

boolean sge_bits(bits(m) a, bits(m) b)
    return SInt(a) >= SInt(b);

boolean slt_bits(bits(m) a, bits(m) b)
    return SInt(a) < SInt(b);

boolean sle_bits(bits(m) a, bits(m) b)
    return SInt(a) <= SInt(b);

bits(m) undefined_bitvector(integer m)
    bits(m) result;
    return result;

bits(m) nan_box(integer m, bits(n) x)
    return bitvector_concat(Ones(m - (n)), x);

bits(16) get_16_random_bits()
    return random_bits();

bits(m) shiftr(bits(m) b, integer shift)
    return LSR(b, shift);

bits(m) shiftl(bits(m) b, integer shift)
    return LSL(b, shift);

bits(m) shift_bits_right(bits(m) a, bits(n) b)
    return shiftr(a, UInt(b));

bits(m) shift_bits_left(bits(m) a, bits(n) b)
    return shiftl(a, UInt(b));

integer count_trailing_zeros(bits(m) b)
    return LowestSetBit(b);

integer count_leading_zeros(bits(m) b)
    return m - (HighestSetBit(b) + 1);

bits(m) not_vec(bits(m) a)
    return not_bits(a);

bits(m) or_vec(bits(m) a, bits(m) b)
    return or_bits(a, b);

bits(m) xor_vec(bits(m) a, bits(m) b)
    return eor_bits(a, b);

bits(m) and_vec(bits(m) a, bits(m) b)
    return and_bits(a, b);

bits(m) add_vec(bits(m) a, bits(m) b)
    return add_bits(a, b);

bits(m) sub_vec(bits(m) a, bits(m) b)
    return sub_bits(a, b);

bits(n) sub_vec_int(bits(n) b, integer i)
    return sub_bits(b, get_slice_int(n, i, 0));

///////////////////////////////////////////////////////////////////////////////////////////////////
// String Operations
///////////////////////////////////////////////////////////////////////////////////////////////////

string bits_str(bits(n) a)
    return cvt_bits_str(n, a);

string hex_str(integer i)
    return cvt_int_hexstr(i);

string concat_str(string a, string b)
    return append_str_str(a, b);

boolean eq_string(string a, string b)
    return eq_str(a, b);

print_platform(string a)
    return;

plat_term_write(bits(n) a)
    return;

bits(n) hex_bits_backwards((integer, string) t)
    assert FALSE;
    return Zeros();

///////////////////////////////////////////////////////////////////////////////////////////////////
// Architecture Operations
///////////////////////////////////////////////////////////////////////////////////////////////////

exit()
    return;

type barrier_kind;

sail_barrier(barrier_kind b)
    return;

internal_error(string a, integer b, string c)
    assert FALSE;
    return;

boolean plat_enable_htif()
    return TRUE;

boolean speculate_conditional()
    return TRUE;

cancel_reservation()
    return;

boolean match_reservation(bits(64) b)
    return TRUE;

load_reservation(bits(64) b)
    return;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Vector Operations
// - ASL requires the vector element count and element width to be passed as arguments
// - Pretty printing has a list of functions where this should be done
// - The following is this same list, with signatures extended to include the extra arguments
///////////////////////////////////////////////////////////////////////////////////////////////////

bits(width) plain_vector_access(bits(elems * width) b, integer pos, integer elems, integer width)
    assert 0 <= pos && pos < elems;
    return b[pos * width +: width];

bits(elems * width) plain_vector_update(bits(elems * width) b, integer pos, bits(width) a, integer elems, integer width)
    b[pos * width +: width] = a;
    return b;

bits(r * m) vector_init(integer r, bits(m) b)
    return replicate_bits(b, r);

bits(n * m) undefined_vector(integer n, bits(m) b)
    return vector_init(n, b);

bits((4) * (m)) get_velem_quad(bits((m) * (n)) v, integer i, integer n, integer m)
    return bitvector_concat(plain_vector_access(v, (4) * (i) + 3, n, m), bitvector_concat(plain_vector_access(v, (4) * (i) + 2, n, m), bitvector_concat(plain_vector_access(v, (4) * (i) + 1, n, m), plain_vector_access(v, (4) * (i), n, m))));

bits((m) * (4)) get_velem_quad_vec(bits((m) * (n)) v, integer i, integer n, integer m)
    return plain_vector_access(v, (4) * (i), n, m):plain_vector_access(v, (4) * (i) + 1, n, m):plain_vector_access(v, (4) * (i) + 2, n, m):plain_vector_access(v, (4) * (i) + 3, n, m);

bits(m) rev8(bits(m) input)
    bits(m) output = sail_zeros(m);
    integer temp_XT_7;
    for temp_XT_7 = (0) DIV (8) to (m - (8)) DIV (8)
        constant integer i = (temp_XT_7) * (8);
        output = update_subrange_bits(output, i + 7, i, subrange_bits(input, m - (i) - (1), m - (i) - (8)));
    return output;

bits((n) * ((m) * (8))) vrev8(integer m, bits((n) * ((m) * (8))) input, integer n, integer h)
    bits((n) * ((m) * (8))) output = input;
    for i = 0 to n - (1)
        output = plain_vector_update(output, i, rev8(plain_vector_access(input, i, n, (m) * (8))), n, m * 8);
    return output;

bits((8) * (m)) get_velem_oct_vec(integer n, bits((n) * (m)) v, integer i, integer h, integer m)
    return plain_vector_access(v, (8) * (i), n, m):plain_vector_access(v, (8) * (i) + 1, n, m):plain_vector_access(v, (8) * (i) + 2, n, m):plain_vector_access(v, (8) * (i) + 3, n, m):plain_vector_access(v, (8) * (i) + 4, n, m):plain_vector_access(v, (8) * (i) + 5, n, m):plain_vector_access(v, (8) * (i) + 6, n, m):plain_vector_access(v, (8) * (i) + 7, n, m);

///////////////////////////////////////////////////////////////////////////////////////////////////
// Array Operations
// - Array update is mutation for ASL, wrap in copies to get immutable Sail behaviour.
// - Means update is no longer poly, but only one case of non-bitvector array elements.
///////////////////////////////////////////////////////////////////////////////////////////////////

type TLB_Entry;
type option;

array [0 .. N] of (option,TLB_Entry) plain_vector_update(array [0 .. N] of (option,TLB_Entry) vec, integer pos, (option,TLB_Entry) var, integer N)
    vec[pos] = var;
    return vec;

