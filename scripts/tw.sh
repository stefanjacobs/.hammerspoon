#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Try to find, if the timewarrior is actively tracking work with some AWK magic - after the return code does not work any more
# TMP=$(/usr/local/bin/timew continue work > /dev/null 2>&1)
SUMMARY=$(/usr/local/bin/timew summary :ids | awk 'FNR>3' | awk '{print substr($0, 20); }' | column -t | awk '{print $4}' | grep '-')

if [ $? -eq 0 ]; then
  TMP=$(/usr/local/bin/timew stop)
  echo -e "${RED}STOPPING${NC} work tracking"
else
  TMP=$(/usr/local/bin/timew continue)
  echo -e "${GREEN}CONTINUING${NC} work tracking"
fi
