#!/bin/zsh

# variables
NAME="$1"

CONFIG_DIR="$HOME/.config"
THEME_DIR="$HOME/.themes"

GTK2_CONF="$HOME/.gtkrc-2.0"
GTK3_CONF="$CONFIG_DIR/gtk-3.0/settings.ini"
XSETTTINGSD_CONF="$CONFIG_DIR/xsettingsd/xsettingsd.conf"
GTK4_CONF_DIR="$CONFIG_DIR/gtk-4.0"
GTK4_CONF="$GTK4_CONF_DIR/settings.ini"

PREFER_DARK="$2"

gtk3() {
    echo setting gtk3
    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$NAME\"/" $GTK3_CONF
    gsettings set org.gnome.desktop.interface gtk-theme "$NAME"
}

gtk2() {
    echo setting gtk2
    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$NAME\"/" $GTK2_CONF
}

gtk4() {
    echo setting gtk4

    rm $GTK4_CONF_DIR/gtk.css $GTK4_CONF_DIR/gtk-dark.css
    if [[ -L "$GTK4_CONF_DIR/assets" ]]; then rm $GTK4_CONF_DIR/assets; fi

    ln -sf $THEME_DIR/$NAME/gtk-4.0/gtk.css $GTK4_CONF_DIR/gtk.css
    ln -sf $THEME_DIR/$NAME/gtk-4.0/gtk-dark.css $GTK4_CONF_DIR/gtk-dark.css

    if [[ -d "$THEME_DIR/$NAME/gtk-4.0/assets/" ]]; then
        ln -sf $THEME_DIR/$NAME/gtk-4.0/assets/ $GTK4_CONF_DIR/assets
    fi

    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$NAME\"/" $GTK4_CONF
}

xsettingsd() {
    echo setting xsettingsd
    sed -i "s/^Net\/ThemeName .*/Net\/ThemeName \"$NAME\"/" $XSETTTINGSD_CONF
}

toggle_light() {
    local gtk_dark="s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=1/"
    local gtk_light="s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=0/"

    if [[ $PREFER_DARK == "true" ]]; then
        echo toggle dark mode
        sed -i $gtk_dark $GTK4_CONF
        sed -i $gtk_dark $GTK3_CONF
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    else
        echo toggle light mode
        sed -i $gtk_light $GTK4_CONF
        sed -i $gtk_light $GTK3_CONF
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    fi
}

gtk2
gtk3
gtk4
xsettingsd
toggle_light

# ?flatpak
# override flatpak gtk theme
# install current gtk theme