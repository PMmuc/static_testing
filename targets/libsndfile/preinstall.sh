#!/bin/bash

apt-get update && \
    apt-get install -y git make autoconf autogen automake build-essential libasound2-dev \
  libflac-dev libogg-dev libtool libvorbis-dev libopus-dev libmp3lame-dev \
  libmpg123-dev pkg-config 2to3 python2-minimal python2 dh-python python-is-python3 bear
