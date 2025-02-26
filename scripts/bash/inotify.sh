#!/bin/bash

WATCH_DIR="/shares"

echo "[$(date)] Recursively watching $WATCH_DIR for executable files..."

inotifywait -m -r -e close_write --format "%w%f" "$WATCH_DIR" | while read -r FILE; do
    if [[ "$FILE" =~ \.exe$ ]]; then
        chmod 770 "$FILE"
        echo "[$(date)] Set 770 permissions on $FILE"
    fi
done