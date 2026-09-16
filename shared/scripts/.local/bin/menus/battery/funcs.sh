#!/bin/zsh

source "${0:A:h:h}/helper.sh"

function noti() {
    notify_std "batt" "" "BATT" "100"
}

$1