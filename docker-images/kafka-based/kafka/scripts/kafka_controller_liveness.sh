#!/usr/bin/env bash
set -e

sleep 3
for proc in /proc/*[0-9];
  do if readlink -f "$proc"/exe | grep -q java; then exit 0; fi;
done

exit 1
