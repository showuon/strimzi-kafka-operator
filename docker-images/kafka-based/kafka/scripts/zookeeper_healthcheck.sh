#!/usr/bin/env bash
set -e

OK=$(echo ruok | nc 127.0.0.1 12181)
if [ "$OK" == "imok" ]; then
    # checking if the node is a follower or a leader, otherwise, it's not ready
    SRVR=$(echo srvr | nc 127.0.0.1 12181 | grep "Mode:" | grep "leader\|follower")
    if [ ! -z "$SRVR" ]; then
        exit 0
    fi
fi

exit 1