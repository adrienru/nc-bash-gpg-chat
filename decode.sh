#!/bin/bash
TMP_IN=$1

if (( $# != 1 )); then
    echo "Usage:"
    echo -e "\tdecode.sh tmp_in"
    exit 1
fi

clear
echo -e "Here will be incoming message\n\n"

while true; do
    cat $TMP_IN | while read line; do echo $line | base64 -d | gpg -d; done 2> >(while read line; do echo -e "\e\033[37$line\e[0m" >&2; done) 1> >(while read line; do echo -e "\e\033[7m  $line  \e\033[0m"; done)
done
