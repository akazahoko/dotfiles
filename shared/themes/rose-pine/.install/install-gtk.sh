#!/bin/zsh

# Note: rose-pine themes are dark but need set prefer white bc gtk-dark.css isn't working,
# Do: replace gtk-dark.css with gtk.css works

NAME="rose-pine-gtk"
GTK3_DEST_DIR=$HOME/.themes

TEMP_DIR="/tmp/$NAME"
GTK3_SRC_DIR="$TEMP_DIR/gtk3"
GTK4_SRC_DIR="$TEMP_DIR/gtk4"

FLAVORS=("rose-pine" "rose-pine-dawn" "rose-pine-moon")

install() {
    local REPO="https://github.com/rose-pine/gtk.git"

    git clone --depth=1 $REPO $TEMP_DIR

    for dir in $TEMP_DIR/gtk3/*/; do
        cp $dir/gtk-3.0/gtk.css $dir/gtk-3.0/gtk-dark.css
        cp $dir/gtk-3.20/gtk.css $dir/gtk-3.20/gtk-dark.css
    done

    for item in "${FLAVORS[@]}"; do
        mkdir -p "$GTK3_SRC_DIR"/"$item"-gtk/gtk-4.0
        cp "$GTK4_SRC_DIR"/"$item".css "$GTK3_SRC_DIR"/"$item"-gtk/gtk-4.0/gtk.css
        cp "$GTK4_SRC_DIR"/"$item".css "$GTK3_SRC_DIR"/"$item"-gtk/gtk-4.0/gtk-dark.css
    done

    cp -r $GTK3_SRC_DIR/* $GTK3_DEST_DIR
}


clean() {
    rm -rf $TEMP_DIR
}

install
clean