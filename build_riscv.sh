#!/bin/bash -xe

OUTDIR=asl_model
MODEL=rv64d

# Make sure sail is built and installed
dune build
dune install

# Build RISC-V model
mkdir -p sail-riscv/build
rm -f sail-riscv/build/model/rv64d*.asl
cmake -B sail-riscv/build sail-riscv -DCMAKE_BUILD_TYPE=Debug
cmake --build sail-riscv/build --target generated_asl_rv64d

# Assuming it worked out, copy results to output
mkdir -p asl_model
cp sail-riscv/build/model/rv64d*.asl $OUTDIR/

# Try to type check it
asli --no-aarch64 --prelude $OUTDIR/prelude.asl $OUTDIR/sail_prelude.asl $OUTDIR/${MODEL}_support.asl $OUTDIR/${MODEL}_instrs.asl $OUTDIR/${MODEL}_decode.asl $OUTDIR/override.asl
