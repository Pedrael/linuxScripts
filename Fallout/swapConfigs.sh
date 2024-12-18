#!/bin/bash

# Source folder containing your modded files
SOURCE_FOLDER="./Fallout4"

# Destination folder (Fallout 4 mod directory)
DEST_FOLDER="/home/deck/.local/share/Steam/steamapps/compatdata/377160/pfx/drive_c/users/steamuser/AppData/Local/Fallout4"

# Check if source folder exists
if [ -d "$SOURCE_FOLDER" ]; then
    echo "Copying files from $SOURCE_FOLDER to $DEST_FOLDER..."
    
    # Copy the files to the destination
    cp -r "$SOURCE_FOLDER"/* "$DEST_FOLDER"

    echo "Files copied successfully!"
else
    echo "Source folder not found: $SOURCE_FOLDER"
fi
