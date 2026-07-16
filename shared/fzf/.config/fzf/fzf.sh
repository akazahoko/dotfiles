#!/bin/zsh

source $HOME/.config/fzf/theme.sh

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
    --layout=reverse \
    --bind='alt-p:toggle-preview' \
    --bind='alt-j:down' \
    --bind='alt-k:up' \
    --preview='bat {}' \
    --preview-window=down:60% \
"
