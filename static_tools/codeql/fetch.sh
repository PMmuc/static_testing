#!/bin/bash
set -e

CODEQL_VERSION=v2.15.2; \
cd $STA
mkdir -p repo &&\
	cd repo && \
	curl -sL \
    https://github.com/github/codeql-action/releases/download/codeql-bundle-${CODEQL_VERSION}/codeql-bundle-linux64.tar.gz | \
	tar -xz
	mv codeql/* ../ && \
	cd ..