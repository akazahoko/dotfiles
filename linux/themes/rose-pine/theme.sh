#!/bin/zsh

# /home/lain/.dotfiles/linux/themes/rose-pine
SCRIPT_DIR="${0:A:h}"
source "${SCRIPT_DIR:h}/.helper.sh"

AVAILBLE_FLAVORS=("main" "moon" "dawn")
AVAILBLE_HIGHLIGHTS=("love" "gold" "rose" "pine" "foam" "iris")

# default values
FLAVOR=${1:-"main"}
HIGHLIGHT=${2:-"rose"}

GTK_THEME="rose-pine-$FLAVOR-gtk"
GTK_PREFER_DARK="true"

KVANTUM_THEME="rose-pine-$FLAVOR-$HIGHLIGHT"

typeset -A LOOKUP_RGB

case $FLAVOR in
    main)
        LOOKUP_RGB=(
            base            "191724"
            surface         "1f1d2e"
            overlay         "26233a"
            muted           "6e6a86"
            subtle          "908caa"
            text            "e0def4"
            love            "eb6f92"
            gold            "f6c177"
            rose            "ebbcba"
            pine            "31748f"
            foam            "9ccfd8"
            iris            "c4a7e7"
            highlightLow    "21202e"
            highlightMed    "403d52"
            highlightHigh   "524f67"
        )
    ;;
    moon)
        LOOKUP_RGB=(
            base            "232136"
            surface         "2a273f"
            overlay         "393552"
            muted           "6e6a86"
            subtle          "908caa"
            text            "e0def4"
            love            "eb6f92"
            gold            "f6c177"
            rose            "ea9a97"
            pine            "3e8fb0"
            foam            "9ccfd8"
            iris            "c4a7e7"
            highlightLow    "2a283e"
            highlightMed    "44415a"
            highlightHigh   "56526e"
        )
    ;;
    dawn)
        LOOKUP_RGB=(
            base            "faf4ed"
            surface         "fffaf3"
            overlay         "f2e9e1"
            muted           "9893a5"
            subtle          "797593"
            text            "575279"
            love            "b4637a"
            gold            "ea9d34"
            rose            "d7827e"
            pine            "286983"
            foam            "56949f"
            iris            "907aa9"
            highlightLow    "f4ede8"
            highlightMed    "dfdad9"
            highlightHigh   "cecacd"
        )
;;
esac

tweak() {
    case $FLAVOR in
        main) VSCODE_THEME="Rosé Pine";;
        moon) VSCODE_THEME="Rosé Pine Moon";;
        dawn) VSCODE_THEME="Rosé Pine Dawn";;
    esac
    
    if [[ $FLAVOR == "main" ]]; then
        GTK_THEME="rose-pine-gtk"
        KVANTUM_THEME="rose-pine-$HIGHLIGHT"
    fi

    if [[ $FLAVOR == "dawn" ]]; then
        GTK_PREFER_DARK="false"
    fi

}

# main
check_available

tweak

echo "$LOOKUP_RGB[$HIGHLIGHT]ff"

change_code "$VSCODE_THEME"
change_foot "$SCRIPT_DIR/$FLAVOR"
change_fuzzel "$SCRIPT_DIR/$FLAVOR" "$LOOKUP_RGB[$HIGHLIGHT]ff"
change_fzf "$SCRIPT_DIR/$FLAVOR"
change_gtk "$GTK_THEME" "$GTK_PREFER_DARK"
change_hyprland "$SCRIPT_DIR/$FLAVOR"
change_kvantum "$KVANTUM_THEME"
change_waybar "$SCRIPT_DIR/$FLAVOR"