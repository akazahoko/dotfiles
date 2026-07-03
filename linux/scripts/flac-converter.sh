#!/bin/zsh

FILE=$(realpath "$1")
DIR=$(dirname "$FILE")
FILENAME=$(basename "$FILE")
ALBUM=${FILENAME%.*}

ffprobe -v error -show_entries format_tags=CUESHEET -of default=noprint_wrappers=1:nokey=1 "$FILE" > "$DIR/cuesheet.cue"

cd "$DIR"

shnsplit -f ""$DIR"/cuesheet.cue" -o flac -t ""$ALBUM"_%n" $FILE

cuetag.sh "cuesheet.cue" "$ALBUM"_[0-9]*.flac

rm cuesheet.cue