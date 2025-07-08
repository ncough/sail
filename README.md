# Sail to ASL

Fork of [Sail](https://github.com/rems-project/sail) with a plugin to output ASL, along with
a few minor tweaks to make this easier. This is not a general translation, but enough
to get the [RISC-V](https://github.com/riscv/sail-riscv) model mostly translated, which
can also be found here in directly `asl_model`.

## Building

Assuming you have `asli` available (with the necessary type system extensions), 
it should be as simple as running `./build_riscv.sh`.
This will build `sail`, our plugin and invoke it on the `sail-riscv` model.
It will also run `asli` over the results, validating that the produced files parse and type check.
The resulting files will be copied to `asl_model/*.asl`.

## Structure

There is a plugin in `src/sail_asl_backend/`. It mirrors the `lem` plugin, with a few extra
transforms to eliminate many of the language features widely used in Sail but not available
in ASL. Notably:
* newtypes
* unions over record types
* variable binding in `match` expressions
* poly types and functions over type arguments

In addition to these, the languages differ significantly in terms of structure.
ASL considers a distinction between expressions and statements, whereas these are unified in Sail.
ASL also assumes a structured definition of the architecture, featuring a decode tree and
a series of instruction objects, whereas Sail is more general purpose.
Some heuristics are necessary to get this structure back out.

We have also had to mess with some of Sail's existing transforms:
* The type system has a notion of which types can be undefined and which cannot. We abuse the notion of undefined throughout the plugin and lack similar type constraints in ASL, so this step of the checking has been turned off.
* Functions can have clauses, corresponding to pattern matching over the function arguments. There is a transform to merge these into a single clause with a top-level pattern match. However, in doing so it merges all of the parameters into a tuple. This sucks, so we alter the transform to not do this.

## TODO

- [x] Interpret `ExecutionResult` as some ASL outcome.
- [x] Appears to be a bug where returned `ExecutionResult` isn't being properly set if its conditional. (`0xfff010ef`)
- [x] Stop generating `case` statements until ASL bugs are fixed.
- [x] Need to shim `vmem_read` and `vmem_write`.
- [x] Sanity check decoder with SMT. There are collision in the decoder, but these might be resolved by guards? If this is not the case, then need to retain ordering from Sail model somehow. Turns out there is one collision, but the two implementations are semantically equivalent. Not clear if one can just replace the other due to feature flags. (`ZBKB_PACKW`, `ZBB_EXTOP`)
- [x] `MASKTYPEI`, `MASKTYPEV`, `MOVETYPEI` has an unknown integer hanging around. (`0x5c0030d7`, `0x5e003057`)
- [ ] `MVVCOMPRESS` has some issue with `int_of_expr`. (`0x5e0020d7`)
- [ ] `MMTYPE` is very slow or hanging.
- [ ] `zrem_int` is missing from post-processing. (`0x8a202057`)
- [x] Missing `lsl_bits` in prelude. (`0x00201133`)
- [ ] Dynamic bitvector remaining. Looks like rotate implementation. (`0x401050b3`)
- [ ] Somehow left a `zeros_bits` in there. (`0xb800c157`)
- [ ] Patch out `FIXME: unsupported fence` print statement in model.
- [ ] Patch in register array. A post-process script is probably the best way to make sure the old registers are fully eliminated.
- [ ] Patch in vector array. Same as above.
- [ ] Map vector accesses to `Elem.set` and `Elem.get` to improve reuse of existing vectoriser.
- [ ] Status flags? Can these be matched up to ARMv8?
- [ ] Force split `get_lmul_pow()` somehow, to ensure we have static bitvector widths. Might be best to just post-process this too, effectively inlining the function, so that the built-in `if` splitting can manage it.
- [ ] Preserve bit-field globals through the translation from Sail. Hopefully just turning some stage of and extending the pretty printer.
- [ ] Implement missing floating point operations by pulling from ARMv8 model. 

## ASL TODO

- [ ] Generalise `PSTATE` hacks so we can do the same thing here? Or maybe RISC-V provides enough wrappers to do this purely with overrides.
- [ ] Need to replace late `UNKNOWN` with an arbitrary constant. Or make sure it doesn't happen.
- [ ] ASL doesn't support return in `case`. This is probably more of a heuristic at this point. Can keep this, as long as the body of the match doesn't return.
- [ ] ASL doesn't support conditional assignment to tuple variables.
- [ ] RISC-V model handles errors as values, rather than exceptions. The result is lots of if statements, blocking optimisation of the good path. Requires if statement splitting across function boundaries, which has previously been used as a heuristic to not split.
