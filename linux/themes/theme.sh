#!/bin/zsh

SCRIPT_DIR=${0:A:h}
THEME_NAME=$1
THEME_DIR=$SCRIPT_DIR/$THEME_NAME
HIGHLIGHT_COLOR=$2

CONFIG_DIR=$HOME/.config

change_waybar() {
    local WAYBAR_DIR=$CONFIG_DIR/waybar
    ln -sf $THEME_DIR/waybar.css $WAYBAR_DIR/theme.css
    killall waybar > /dev/null 2>&1
    waybar > /dev/null 2>&1 &
}

change_fuzzel() {
    local FUZZEL_DIR=$CONFIG_DIR/fuzzel
    ln -sf $THEME_DIR/fuzzel.ini $FUZZEL_DIR/theme.ini
}

change_code() {
    local CODE_JSON="$CONFIG_DIR/Code/User/settings.json"

    case $THEME_NAME in
        catppuccin/mocha) CODE_THEME="Catppuccin Mocha";;
        catppuccin/latte) CODE_THEME="Catppuccin Latte";;
        rose-pine) CODE_THEME="Rosé Pine";;
        rose-pine/dawn) CODE_THEME="Rosé Pine Dawn";;
    esac

    jq '.["workbench.colorTheme"] = "'$CODE_THEME'"' $CODE_JSON \
    > /tmp/code_settings.json \
    && mv /tmp/code_settings.json $CODE_JSON
}

change_hyprland() {
    local HYPRLAND_DIR="$CONFIG_DIR/hypr/hyprland"
    ln -sf $THEME_DIR/hyprland.lua $HYPRLAND_DIR/theme.lua
    hyprctl reload
}

change_foot() {
    local FOOT_DIR="$CONFIG_DIR/foot"
    ln -sf $THEME_DIR/foot.ini $FOOT_DIR/theme.ini
}

change_fzf() {
    local FZF_DIR="$CONFIG_DIR/fzf"
    ln -sf $THEME_DIR/fzf.sh $FZF_DIR/theme.sh
}

change_kvantum() {
    local KVANTUM_CONFIG="$CONFIG_DIR/Kvantum/kvantum.kvconfig"
    local NEW_THEME="${THEME_NAME/\//-}${HIGHLIGHT_COLOR:+-$HIGHLIGHT_COLOR}"

    sed -i "s/^theme=.*/theme=$NEW_THEME/" $KVANTUM_CONFIG
}

change_gtk_4() {
    local GTK_4_DIR="$CONFIG_DIR/gtk-4.0"
    ln -sf "$THEME_DIR/gtk-4.0/$HIGHLIGHT_COLOR/assets" "$GTK_4_DIR"
    ln -sf "$THEME_DIR/gtk-4.0/$HIGHLIGHT_COLOR/gtk-dark.css" "$GTK_4_DIR"
    ln -sf "$THEME_DIR/gtk-4.0/$HIGHLIGHT_COLOR/gtk.css" "$GTK_4_DIR"
}

change_gtk_3() {
    local GTK_3_DIR="$HOME/.themes/theme/gtk-3.0"

    ln -sf "$THEME_DIR/gtk-3.0/$HIGHLIGHT_COLOR/assets" "$GTK_3_DIR/"
    ln -sf "$THEME_DIR/gtk-3.0/$HIGHLIGHT_COLOR/gtk-dark.css" "$GTK_3_DIR/"
    ln -sf "$THEME_DIR/gtk-3.0/$HIGHLIGHT_COLOR/gtk.css" "$GTK_3_DIR/"
}

# change_waybar
# change_fuzzel
# change_code
# change_hyprland
# change_foot
# change_fzf

change_kvantum $1 $2
# change_gtk_3