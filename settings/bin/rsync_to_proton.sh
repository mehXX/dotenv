#!/bin/bash

LOCK_FILE="/tmp/proton_sync.lock"

if [ -e "$LOCK_FILE" ]; then
    exit 0
fi

touch "$LOCK_FILE"

rclone sync ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Settings proton:Settings
rclone sync ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents proton:Documents
rclone sync ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Health proton:Health
rclone sync ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Passwords proton:Passwords

rm "$LOCK_FILE"
