#!/bin/bash

TMP_OUT="$1"
TMP_IN="$2"
PORT="$3"
HOST="$4"


if (( $# != 4 )); then
    echo "Usage:"
    echo -e "\tnc.sh out_fifo in_fifo port host"
    exit 1
fi

clear
echo "Client netcat"

while true; do
    cat $TMP_OUT
done | nc -t $HOST $PORT > $TMP_IN
