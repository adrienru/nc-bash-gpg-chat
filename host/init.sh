#!/bin/bash
PORT=$1
RECIP=$2
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

TMP_IN=$(mktemp)
TMP_OUT=$(mktemp)
rm -rf $TMP_IN $TMP_OUT
mkfifo $TMP_IN
mkfifo $TMP_OUT

if (( $# != 2 )); then
    echo "Usage:"
    echo -e "\tinit.sh 8888 recipient_key"
    exit 1
fi

tmux kill-session -t nc-bash-gpg-chat-host &>/dev/null
tmux new -s nc-bash-gpg-chat-host -d
tmux split-window -h -t nc-bash-gpg-chat-host
tmux split-window -v -t nc-bash-gpg-chat-host:0.0
tmux send-keys -t nc-bash-gpg-chat-host:0.1 "$SCRIPTPATH/nc.sh $TMP_OUT $TMP_IN $PORT" Enter
tmux send-keys -t nc-bash-gpg-chat-host:0.0 "$SCRIPTPATH/decode.sh $TMP_IN" Enter
tmux send-keys -t nc-bash-gpg-chat-host:0.2 "$SCRIPTPATH/encode.sh $TMP_OUT $RECIP" Enter
tmux select-pane -t nc-bash-gpg-chat-host:0.2


tmux attach -t nc-bash-gpg-chat-host

rm -rf $TMP_IN $TMP_OUT
