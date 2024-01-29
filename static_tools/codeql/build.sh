#!/bin/bash
set -e

if [ ! -d "$STA/repo" ]; then
    echo "fetch.sh must be executed first."
    exit 1
fi

cd "$STA/repo"
