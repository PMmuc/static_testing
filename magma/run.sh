#!/bin/bash

##
# Pre-requirements:
# - env STA: path to static_analysis work dir
# - env TARGET: path to target work dir
# - env OUT: path to directory where artifacts are stored
# - env SHARED: path to directory shared with host (to store results)
# - env PROGRAM: name of program to run (should be found in $OUT)
# - env ARGS: extra arguments to pass to the program
# - env STAARGS: extra arguments to pass to the analyser
# - env POLL: time (in seconds) to sleep between polls
# - env TIMEOUT: time to run the campaign
# - env MAGMA: path to Magma support files
# + env LOGSIZE: size (in bytes) of log file to generate (default: 1 MiB)
##

# change working directory to somewhere accessible by the analyzer and target
cd "$SHARED"

echo "Analyzer launched at $(date '+%F %R')"
# set default max log size to 1 MiB
LOGSIZE=${LOGSIZE:-$[1 << 20]}

"$STA/run.sh" | \
    multilog n2 s$LOGSIZE "$SHARED/log"

if [ -f "$SHARED/log/current" ]; then
    cat "$SHARED/log/current"
fi

echo "Analyzer terminated at $(date '+%F %R')"
