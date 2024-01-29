#!/bin/bash
set -e
#git config --global http.postBuffer 1048576000
#git config --global https.postBuffer 1048576000
#git clone --no-checkout https://github.com/facebook/infer.git "$STA/repo"
# the full commit id can be retrieved with git rev-parse [part of id]
#git -C "$STA/repo" checkout f9b6f2bdf1abadebef9767294f7ffd93d514fa1f
#wget -O "$FUZZER/repo/afl_driver.cpp" \
#    "https://cs.chromium.org/codesearch/f/chromium/src/third_party/libFuzzer/src/afl/afl_driver.cpp"
#cp "$S/src/afl_driver.cpp" "$FUZZER/repo/afl_driver.cpp"

INFER_VERSION=v1.1.0; \
cd $STA
mkdir -p repo &&\
	cd repo && \
	curl -sL \
    https://github.com/facebook/infer/releases/download/${INFER_VERSION}/infer-linux64-${INFER_VERSION}.tar.xz | \
	tar xJ && \
	cd infer-linux64-${INFER_VERSION} && \
	mv * ../ && \
	cd .. && \
	rm -rf infer-linux64-${INFER_VERSION}