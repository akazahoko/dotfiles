#!/bin/zsh

source "${0:A:h}/.helper.sh"

STATUS=$(playerctl status)
PLAYER=$(playerctl metadata --format "{{playerName}}")

function resume_player() {
    playerctl play
}

function pause_player() {
    playerctl pause
}

function next_track() {
    playerctl -p $PLAYER next
}

function prev_track() {
    playerctl -p $PLAYER previous
}

case $1 in
play-pause)
    case "$STATUS" in
    Playing)
        pause_player
        ;;
    Paused)
        resume_player
        ;;
    esac
    ;;
next)
    next_track
    ;;
previous)
    prev_track
    ;;
esac

# refresh variables
STATUS=$(playerctl status)
TITLE=$(playerctl -p $PLAYER metadata title)
ARTIST=$(playerctl -p $PLAYER metadata artist)
LENGTH=$(playerctl -p $PLAYER metadata length)
ART=$(playerctl -p $PLAYER metadata mpris:artUrl)

notify_std "playerctl" "$ART" $TITLE "$ARTIST\n$PLAYER - $STATUS"
