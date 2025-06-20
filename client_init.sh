#!/bin/bash
HOST="$1"
PORT="$2"
RECIP="$3"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if (( $# != 3 )); then
    echo "Usage:"
    echo -e "\tinit.sh host port recipient_key"
    exit 1
fi

TMP_IN=$(mktemp)
TMP_OUT=$(mktemp)
rm -rf $TMP_IN $TMP_OUT
mkfifo $TMP_IN
mkfifo $TMP_OUT

session_name='nc-bash-gpg-chat-client'

tmux kill-session -t $session_name &>/dev/null
tmux new -s $session_name -d
tmux split-window -h -t $session_name
tmux split-window -v -t $session_name:0.0
tmux send-keys -t "$session_name:0.1" "\"$SCRIPTPATH/client_nc.sh\" \"$TMP_OUT\" \"$TMP_IN\" \"$PORT\" \"$HOST\"" Enter
tmux send-keys -t $session_name:0.0 "$SCRIPTPATH/decode.sh $TMP_IN" Enter
tmux send-keys -t $session_name:0.2 "$SCRIPTPATH/encode.sh $TMP_OUT $RECIP" Enter
tmux select-pane -t $session_name:0.2


tmux attach -t $session_name

rm -rf $TMP_IN $TMP_OUT
