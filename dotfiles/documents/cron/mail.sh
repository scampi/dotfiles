#! /usr/bin/env bash

_error() {
    err_code=$?
    if _is_connected && [ $err_code -ne 0 ]; then
        echo "Error with $1: got error code[$err_code]"
        exit 1
    fi
}

_clean() {
    rm -f $LOCK
    pkill -x offlineimap
    pkill -x imapfilter
    pkill -x notmuch
}

_is_connected() {
    wget -q --spider http://google.com
}

LOCK="/tmp/mail.lock"

trap _clean INT TERM QUIT

if _is_connected && [ ! -e "$LOCK" ]; then
    trap "rm -f $LOCK" EXIT INT TERM QUIT
    touch "$LOCK"

    _is_connected && imapfilter -v
    _error "imapfilter"

    date=$(date +"%H")
    if [ $date = "14" ]; then
        _is_connected && offlineimap -s
    else
        _is_connected && offlineimap -q -s
    fi
    _error "offlineimap"
fi

# vim: set ts=4 sw=4 expandtab:
