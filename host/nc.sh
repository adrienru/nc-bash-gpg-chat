#!/bin/bash
TMP_OUT=$1
TMP_IN=$2
PORT=$3

if (( $# != 3 )); then
    echo "Usage:"
    echo -e "\tnc.sh out_fifo in_fifo port"
    exit 1
fi
clear
echo Running TCP server with in FIFO as $TMP_IN and out FIFO as $TMP_OUT on port $PORT

while true; do
    while read line; do
        echo $line 
    done < $TMP_OUT
done | nc -tlp $PORT > $TMP_IN
