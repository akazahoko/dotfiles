#!/bin/sh

# 1. Capture the first word typed after the script name
THEME="$1"

# 2. Check if the string is empty (nil)
if [ -z "$THEME" ]; then
    echo "Error: No theme name provided."
    echo "Usage: $0 <theme_name>"
    exit 1
fi

# 3. Setup paths
SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
THEME_FILE="$SCRIPT_DIR/themes/$THEME.ini"
TARGET_LINK="$SCRIPT_DIR/theme.ini"

# 4. Check if the file exists
if [ ! -f "$THEME_FILE" ]; then
    echo "Error: Theme '$THEME' does not exist in $SCRIPT_DIR/themes/"
    exit 1
fi

# 5. Execute the switch
ln -sf "$THEME_FILE" "$TARGET_LINK"

echo "Switched to theme: $THEME"