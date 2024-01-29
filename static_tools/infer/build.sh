#!/bin/bash
set -e

if [ ! -d "$STA/repo" ]; then
    echo "fetch.sh must be executed first."
    exit 1
fi

cd "$STA/repo"

# Build opam deps first, then clang, then infer. This way if any step
# fails we don't lose the significant amount of work done in the
# previous steps.
#./build-infer.sh --only-setup-opam

#eval $(opam env) && \
#	./autogen.sh && \
#	./configure && \
#	./facebook-clang-plugins/clang/setup.sh
	
#make install-with-libs \
#	BUILD_MODE=opt \
#	PATCHELF=patchelf \
#	DESTDIR="/infer-release" \
#	libdir_relative_to_bindir="../lib"
	
# Install infer
PATH="$STA/repo/bin:${PATH}"