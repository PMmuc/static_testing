#!/bin/bash
set -e

##
# Pre-requirements:
# - env TARGET: path to target work dir
# - env OUT: path to directory where artifacts are stored
# - env CC, CXX, FLAGS, LIBS, etc...
##

cd "$TARGET"
bear -- make -j$(nproc) all

mv ./compile_commands.json $OUT/compile_commands.json
