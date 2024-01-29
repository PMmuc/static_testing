#!/bin/bash
set -e

git config --global http.postBuffer 1048576000
git config --global https.postBuffer 1048576000
git clone --no-checkout https://github.com/NASA-SW-VnV/ikos.git "$STA/repo"
# the full commit id can be retrieved with git rev-parse [part of id]
# version v3.1 of ikos
git -C "$STA/repo" checkout a9789d20aa714c6698a37610f5c936406f48d379

#wget -O "$FUZZER/repo/afl_driver.cpp" \
#    "https://cs.chromium.org/codesearch/f/chromium/src/third_party/libFuzzer/src/afl/afl_driver.cpp"
#cp "$S/src/afl_driver.cpp" "$FUZZER/repo/afl_driver.cpp"
