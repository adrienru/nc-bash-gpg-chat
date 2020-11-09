#!/bin/bash
TMP_OUT=$1
recipient=$2

if (( $# != 2 )); then
    echo "Usage:"
    echo -e "\tencode.sh tmp_out recipient_key"
    exit 1
fi

clear
echo -e "Write your message here\n\n"

while read line; do
    echo $line | gpg -sear $recipient | base64 | tr -d '\n' > $TMP_OUT
    echo > $TMP_OUT
done
