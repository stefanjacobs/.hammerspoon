#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Try to find, if the timewarrior is actively tracking work with some AWK magic - after the return code does not work any more

OUTPUT=$(/opt/homebrew/bin/timew)

if [[ $OUTPUT == *"There is no active time tracking."* ]]; then
    # echo "Es gibt keine aktive Zeitverfolgung."
    TMP=$(/opt/homebrew/bin/timew continue)
    echo -e "${GREEN}CONTINUING${NC} work tracking"
elif [[ $OUTPUT == *"Tracking work"* ]]; then
    # echo "Es wird Arbeit verfolgt."
    TMP=$(/opt/homebrew/bin/timew stop)
    echo -e "${RED}STOPPING${NC} work tracking"
else
    echo "Seltsamer Zustand."
fi

