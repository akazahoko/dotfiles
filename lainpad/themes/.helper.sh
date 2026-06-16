#!/bin/zsh

HELPER_DIR="${0:A:h}"
CONFIG_DIR="$HOME/.config"

check_available() {
    if [[ ${AVAILBLE_FLAVORS[(I)$FLAVOR]} -eq 0 ]]; then
        echo "Error: $HIGHLIGHT is not a valid flavor."
        exit 1
    fi

    if [[ ${AVAILBLE_HIGHLIGHTS[(I)$HIGHLIGHT]} -eq 0 ]]; then
        echo "Error: $HIGHLIGHT is not a valid highlight."
        exit 1
    fi
}

# usage: change_gtk theme_name prefer_dark
change_gtk() {
    local NAME="$1"
    local PREFER_DARK="$2"

    local GTK2_CONF="$HOME/.gtkrc-2.0"
    local GTK3_CONF="$CONFIG_DIR/gtk-3.0/settings.ini"
    local GTK4_CONF_DIR="$CONFIG_DIR/gtk-4.0"
    local GTK4_CONF="$GTK4_CONF_DIR/settings.ini"
    local XSETTTINGSD_CONF="$CONFIG_DIR/xsettingsd/xsettingsd.conf"
    local THEME_DIR="$HOME/.themes"

    local DARK="s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=1/"
    local LIGHT="s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=0/"

    # gtk2
    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$NAME\"/" $GTK2_CONF

    # gtk3
    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$NAME\"/" $GTK3_CONF
    gsettings set org.gnome.desktop.interface gtk-theme "$NAME"

    # gtk 4
    rm $GTK4_CONF_DIR/gtk.css $GTK4_CONF_DIR/gtk-dark.css
    if [[ -L "$GTK4_CONF_DIR/assets" ]]; then rm $GTK4_CONF_DIR/assets; fi

    ln -sf $THEME_DIR/$NAME/gtk-4.0/gtk.css $GTK4_CONF_DIR/gtk.css
    ln -sf $THEME_DIR/$NAME/gtk-4.0/gtk-dark.css $GTK4_CONF_DIR/gtk-dark.css

    if [[ -d "$THEME_DIR/$NAME/gtk-4.0/assets/" ]]; then
        ln -sf $THEME_DIR/$NAME/gtk-4.0/assets/ $GTK4_CONF_DIR/assets
    fi

    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$NAME\"/" $GTK4_CONF

    # xsettingsd
    sed -i "s/^Net\/ThemeName .*/Net\/ThemeName \"$NAME\"/" $XSETTTINGSD_CONF

    # dark/light mode
    if [[ $PREFER_DARK == "true" ]]; then
        sed -i $DARK $GTK4_CONF
        sed -i $DARK $GTK3_CONF
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    else
        sed -i $LIGHT $GTK4_CONF
        sed -i $LIGHT $GTK3_CONF
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    fi
}

change_kvantum() {
    local NAME="$1"
    local KVANTUM_CONFIG="$HOME/.config/Kvantum/kvantum.kvconfig"

    sed -i "s/^theme=.*/theme=$NAME/" $KVANTUM_CONFIG
}

change_foot() {
    local THEME_DIR="$1"
    local FOOT_DIR="$CONFIG_DIR/foot"

    ln -sf $THEME_DIR/foot.ini $FOOT_DIR/theme.ini
}

change_fzf() {
    local THEME_DIR="$1"
    local FZF_DIR="$CONFIG_DIR/fzf"

    ln -sf $THEME_DIR/fzf.sh $FZF_DIR/theme.sh
}

change_code() {
    local THEME="$1"
    local CODE_JSON="$CONFIG_DIR/Code/User/settings.json"

    jq '.["workbench.colorTheme"] = "'$THEME'"' $CODE_JSON \
    > /tmp/code_settings.json \
    && mv /tmp/code_settings.json $CODE_JSON
}

change_waybar() {
    local THEME_DIR="$1"
    local WAYBAR_DIR="$CONFIG_DIR/waybar"

    ln -sf $THEME_DIR/waybar.css $WAYBAR_DIR/theme.css
    killall waybar > /dev/null 2>&1
    waybar > /dev/null 2>&1 &
}

change_fuzzel() {
    local theme="$1/fuzzel.ini"
    local dest="$CONFIG_DIR/fuzzel/theme.ini"
    local rgba_hex="$2"

    ln -sf $theme $dest

    # echo $rgba_hex

    # tweak fuzzel highlight
    for item in match selection-match border; do
        sed -i "s/^$item=.*/$item=$rgba_hex/" $dest
    done
}

change_hyprland() {
    local THEME="$1"
    local HYPRLAND_DIR="$CONFIG_DIR/hypr/hyprland"
    
    ln -sf $THEME/hyprland.lua $HYPRLAND_DIR/theme.lua
    hyprctl reload > /dev/null
}