#!/bin/bash
set -e

if [ ! -d "$STA/repo" ]; then
    echo "fetch.sh must be executed first."
    exit 1
fi

cd "$STA/repo"

mkdir build && \
	cd build && \
	cmake \
            -DCMAKE_INSTALL_PREFIX="$STA/repo/build" \
            -DCMAKE_BUILD_TYPE="Debug" \
            -DLLVM_CONFIG_EXECUTABLE="/usr/lib/llvm-14/bin/llvm-config" \
            .. &&\
	make -j $(nproc) &&\
	make install