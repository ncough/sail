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
transforms to eliminate many of the language features widely used in `sail` but not available
in `asl`. Notably:
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

## Issues

We can almost run the full ASL coverage test `:coverage R64 .*`, except:
* We are missing implementations of various floating point ops. These are specified in external C files. For lifting, this isn't a big deal, but it means coverage cannot run these. Could try to pull from ARMv8 model.
* SAIL makes use of euclidean division in the type system. ASL doesn't have a primitive that exactly matches this, but it seems this is generally fine.
* `bv[slice] := expr` needs to know the concrete width of `bv`. We don't know this for certain vector cases, where vector widths can be scaled across multiple registers based on control registers. This breaks many assumptions, as you are suddenly dealing with dynamic bitvectors. Could use the offline technique a force an enumeration of all possible widths?
* We eliminate bit-field globals, which is a little annoying. Might try to get these back.

There are some things to do in `aslp`:
* Break out model init for partial evaluation, so that we can fix some known globals.
* Coupled with this is a change to the partial evaluation state to track whether a variable is a constant, an expression or a fixed global. Modifying writes to a fixed global is a failure, beyond model bounds.
* Break out model randomisation, so that we can create a random initial state for testing.
* Need different heuristics in the coverage, as the field names in the `R64` model aren't useful.
