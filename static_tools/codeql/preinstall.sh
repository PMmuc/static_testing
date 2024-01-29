#!/bin/bash
set -e
apt-get update && \
    mkdir -p /usr/share/man/man1 && \
	apt-get install --yes --no-install-recommends \
      curl \
	  xz-utils \
      zlib1g-dev \
	  python3 \
	  python3-pip && \
rm -rf /var/lib/apt/lists/*

pip install sarif-tools

