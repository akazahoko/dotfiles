#!/bin/sh

STYLE=""
THEME=""

while [ "$#" -gt 0 ]; do
    case "$1" in
        --style)
            # Check if $2 exists AND doesn't start with --
            if [ -z "$2" ] || [ "${2#-}" != "$2" ]; then
                echo "Error: --style requires a value."
                exit 1
            fi
            STYLE="$2"
            shift 2
            ;;
        --theme)
            if [ -z "$2" ] || [ "${2#-}" != "$2" ]; then
                echo "Error: --theme requires a value."
                exit 1
            fi
            THEME="$2"
            shift 2
            ;;
        *)
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done

# 1. Check if ANY arguments were provided
if [ -z "$STYLE" ] && [ -z "$THEME" ]; then
    echo "Error: Must provide at least --style or --theme"
    exit 1
fi

SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)

# 2. Process STYLE if it was provided
if [ -n "$STYLE" ]; then
    STYLE_FILE="$SCRIPT_DIR/styles/$STYLE.css"
    if [ -f "$STYLE_FILE" ]; then
        ln -sf "$STYLE_FILE" "$SCRIPT_DIR/style.css"
        echo "Applied style: $STYLE"
    else
        echo "Missing style file: $STYLE_FILE"
        exit 1
    fi
fi

# 3. Process THEME if it was provided
if [ -n "$THEME" ]; then
    THEME_FILE="$SCRIPT_DIR/themes/$THEME.css"
    if [ -f "$THEME_FILE" ]; then
        ln -sf "$THEME_FILE" "$SCRIPT_DIR/theme.css"
        echo "Applied theme: $THEME"
    else
        echo "Missing theme file: $THEME_FILE"
        exit 1
    fi
fi

# 4. Reload Waybar once at the end
killall waybar > /dev/null 2>&1
waybar > /dev/null 2>&1 &