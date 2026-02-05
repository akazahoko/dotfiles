#!/bin/zsh

WALLPAPER_DIR="$(xdg-user-dir PICTURES)/Grabber"

fd . "$WALLPAPER_DIR"| \
fzf --bind 'enter:execute(swww img {})' \
    --bind 'F5:reload(fd . $HOME/圖片/Grabber)'   \
    --preview '
    chafa -f sixels -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES} {}
    '