#!/bin/bash
set -e

##
# Pre-requirements:
# - env TARGET: path to target work dir
# - env OUT: path to directory where artifacts are stored
# - env CC, CXX, FLAGS, LIBS, etc...
##

if [ ! -d "$TARGET/repo" ]; then
    echo "fetch.sh must be executed first."
    exit 1
fi

cd "$TARGET/repo"
./autogen.sh
./configure --disable-shared
make -j$(nproc) clean
bear -- make -j$(nproc) # ossfuzz/sndfile_fuzzer
mv ./compile_commands.json $OUT/compile_commands.json

#cp -v ossfuzz/sndfile_fuzzer $OUT/
