#!/bin/bash

PLIST_SOURCE_DIR="/Users/ymka/settings/plist"  # Change this to your folder path

# Destination directory for LaunchAgents
DEST_DIR="$HOME/Library/LaunchAgents"

# Check if the source directory exists
if [ ! -d "$PLIST_SOURCE_DIR" ]; then
    echo "Source directory does not exist: $PLIST_SOURCE_DIR"
    exit 1
fi

# Iterate over all .plist files in the source directory
for plist_file in "$PLIST_SOURCE_DIR"/*.plist; do
    plist_name=$(basename "$plist_file")
    dest_plist="$DEST_DIR/$plist_name"

    # Check if the plist already exists in the destination
    if [ -f "$dest_plist" ]; then
        echo "$plist_name already exists in $DEST_DIR. Overwriting..."

        # Unload the existing plist (if it's loaded)
        launchctl unload "$dest_plist"
    fi

    # Copy the plist to the LaunchAgents folder (overwriting the existing one)
    echo "Copying $plist_name to $DEST_DIR..."
    cp "$plist_file" "$DEST_DIR/"

    # Load the new or updated plist file
    launchctl load "$dest_plist"

    echo "$plist_name loaded and started."
done

echo "All .plist files have been copied, loaded, and started."