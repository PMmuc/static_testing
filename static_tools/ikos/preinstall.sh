#!/bin/bash
set -e

apt-get update && \
    mkdir -p /usr/share/man/man1 && \
    apt-get install --yes \
           gcc g++ cmake libgmp-dev libboost-dev libboost-filesystem-dev \
           libboost-thread-dev libboost-test-dev \
           libsqlite3-dev libtbb-dev libz-dev libedit-dev \
           python3 python3-pygments python3-distutils python3-pip \
           llvm-14 llvm-14-dev llvm-14-tools clang-14 vim

rm -rf /var/lib/apt/lists/*
