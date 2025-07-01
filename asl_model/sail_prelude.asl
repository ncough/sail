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
    return a QUOT b;

integer quot_round_zero(integer a, integer b)
    return a QUOT b;

// TODO: Not implemented
integer rem_round_zero(integer a, integer b)
integer emod_int(integer a, integer b)

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

bits(n) zeros(integer n)
    return zeros_bits();

bits(w) get_slice_int(integer w, integer n, integer lo)
    return n[lo +: w];

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

// TODO: Not implemented
bits(m) shiftr(bits(m) b, integer w)
bits(m) shiftl(bits(m) b, integer w)
bits(16) get_16_random_bits()
integer count_trailing_zeros(bits(m) b)
integer count_leading_zeros(bits(m) b)
bits(m) shift_bits_left(bits(m) a, bits(n) b)
bits(m) shift_bits_right(bits(m) a, bits(n) b)

///////////////////////////////////////////////////////////////////////////////////////////////////
// String Operations
///////////////////////////////////////////////////////////////////////////////////////////////////

string bits_str(bits(n) a)
string hex_str(integer i)
string hex_bits_str(bits(n) a)
string concat_str(string a, string b)
bits(n) hex_bits_backwards((integer, string) t)
boolean eq_string(string a, string b)
print_platform(string a)
plat_term_write(bits(n) a)

///////////////////////////////////////////////////////////////////////////////////////////////////
// Architecture Operations
///////////////////////////////////////////////////////////////////////////////////////////////////

exit()
    return;

type barrier_kind;
() sail_barrier(barrier_kind b)
internal_error(string a, integer b, string c)
boolean plat_enable_htif()
boolean speculate_conditional()
() cancel_reservation()
boolean match_reservation(bits(64) b)
() load_reservation(bits(64) b)

///////////////////////////////////////////////////////////////////////////////////////////////////
// Vector Operations
// - ASL requires the vector element count and element width to be passed as arguments
// - Pretty printing has a list of functions where this should be done
// - The following is this same list, with signatures extended to include the extra arguments
///////////////////////////////////////////////////////////////////////////////////////////////////

bits(m) not_vec(bits(m) a)
    return not_bits(a);

bits(m) or_vec(bits(m) a, bits(m) b)
    return or_bits(a, b);

bits(m) xor_vec(bits(m) a, bits(m) b)
    return eor_bits(a, b);

bits(m) and_vec(bits(m) a, bits(m) b)
    return and_bits(a, b);

// TODO: Not implemented
bits(m) add_vec(bits(m) a, bits(m) b)
bits(m) sub_vec(bits(m) a, bits(m) b)
bits(n) sub_vec_int(bits(n) b, integer i)
bits(n * m) undefined_vector(integer n, bits(m) b)

bits(vec DIV elems) plain_vector_access(bits(vec) b, integer pos, integer elems, integer width)
    return b[pos * (vec DIV elems) +: (vec DIV elems)];

bits(m) plain_vector_update(bits(m) b, integer pos, bits(n) a)
    b[pos * n +: n] = a;
    return b;

bits(r * m) vector_init(integer r, bits(m) b)
    return replicate_bits(b, r);

integer vector_length(bits(v) n, integer elems, integer width)
    return elems;

bits((4) * (m)) get_velem_quad(bits((m) * (n)) v, integer i, integer n, integer m)
    return bitvector_concat(plain_vector_access(v, (4) * (i) + 3, n, m), bitvector_concat(plain_vector_access(v, (4) * (i) + 2, n, m), bitvector_concat(plain_vector_access(v, (4) * (i) + 1, n, m), plain_vector_access(v, (4) * (i), n, m))));

bits((m) * (4)) get_velem_quad_vec(bits((m) * (n)) v, integer i, integer n, integer m)
    return plain_vector_access(v, (4) * (i), n, m):plain_vector_access(v, (4) * (i) + 1, n, m):plain_vector_access(v, (4) * (i) + 2, n, m):plain_vector_access(v, (4) * (i) + 3, n, m);

bits(m) rev8(bits(m) input)
    bits(m) output = zeros(m);
    integer temp_XT_7;
    for temp_XT_7 = (0) DIV (8) to (m - (8)) DIV (8)
        constant integer i = (temp_XT_7) * (8);
        output = update_subrange_bits(output, i + 7, i, subrange_bits(input, m - (i) - (1), m - (i) - (8)));
    return output;

bits((n) * ((m) * (8))) vrev8(integer m, bits((n) * ((m) * (8))) input, integer n, integer h)
    bits((n) * ((m) * (8))) output = input;
    for i = 0 to n - (1)
        output = plain_vector_update(output, i, rev8(plain_vector_access(input, i, n, (m) * (8))));
    return output;

bits((8) * (m)) get_velem_oct_vec(integer n, bits((n) * (m)) v, integer i, integer h, integer m)
    return plain_vector_access(v, (8) * (i), n, m):plain_vector_access(v, (8) * (i) + 1, n, m):plain_vector_access(v, (8) * (i) + 2, n, m):plain_vector_access(v, (8) * (i) + 3, n, m):plain_vector_access(v, (8) * (i) + 4, n, m):plain_vector_access(v, (8) * (i) + 5, n, m):plain_vector_access(v, (8) * (i) + 6, n, m):plain_vector_access(v, (8) * (i) + 7, n, m);

