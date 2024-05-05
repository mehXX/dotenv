#!/bin/bash

exec >> /tmp/rsync_to_proton.log

date

SRC_BASE="/Users/ymka/Library/Mobile Documents/com~apple~CloudDocs"
DEST_BASE="/Users/ymka/Library/CloudStorage/ProtonDrive-proton@moonlessday.com"

RSYNC="/opt/homebrew/bin/rsync"

# Sync directories
$RSYNC -av "${SRC_BASE}/Documents" "${DEST_BASE}/Documents"
$RSYNC -av "${SRC_BASE}/Health" "${DEST_BASE}/Health"
$RSYNC -av "${SRC_BASE}/Passwords" "${DEST_BASE}/Passwords"
$RSYNC -av "${SRC_BASE}/Settings" "${DEST_BASE}/Settings"
