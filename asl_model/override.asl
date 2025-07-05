///////////////////////////////////////////////////////////////////////////////////////////////////
// Overrides for Model Config
///////////////////////////////////////////////////////////////////////////////////////////////////

boolean currentlyEnabled(extension merge_var)
    return TRUE;

boolean in32BitMode()
    return FALSE;

// These shouldn't be necessary
() xreg_write_callback(bits(5) reg, bits((pow2_int(3)) * (8)) value)
    return;

// Fixing dynamic vector options
integer get_lmul_pow()
    return 0;
integer get_sew_pow()
    return 3;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Memory Shim
///////////////////////////////////////////////////////////////////////////////////////////////////

__RAM(64) __Memory;

enumeration AccType {AccType_NORMAL};

Mem[bits(64) address, integer size, AccType acctype] = bits(size*8) value
    __WriteRAM(64, size, __Memory, address, value);

bits(size*8) Mem[bits(64) address, integer size, AccType acctype]
    return __ReadRAM(64, size, __Memory, address);

(result, bits(64), ExceptionType) translateAddr(bits((pow2_int(3)) * (8)) vAddr, AccessType ac)
    return (Ok, vAddr, ExceptionType UNKNOWN);

(result, ExceptionType) mem_write_ea(bits(64) addr, integer width, boolean aq, boolean rl, boolean con)
    return (Ok, ExceptionType UNKNOWN);

(result, bits((8) * (width)), ExceptionType) mem_read(AccessType typ, bits(64) paddr, integer width, boolean aq, boolean rel, boolean res)
    data = Mem[paddr, width, AccType_NORMAL];
    return (Ok, data, ExceptionType UNKNOWN);

(result, boolean, ExceptionType) mem_write_value(bits(64) paddr, integer width, bits((8) * (width)) value, boolean aq, boolean rl, boolean con)
    Mem[paddr, width, AccType_NORMAL] = value;
    return (Ok, TRUE, ExceptionType UNKNOWN);

///////////////////////////////////////////////////////////////////////////////////////////////////
// Configuration for Coverage
///////////////////////////////////////////////////////////////////////////////////////////////////

random_state()
  for i = 1 to 31
      wX(i, random_bits());
  cur_privilege = User;
  mstatus = Zeros();
  mstatus = _update_Mstatus_UXL(mstatus, '10');
  return;

