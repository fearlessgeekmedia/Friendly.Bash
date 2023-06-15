#!/bin/bash

source ../friendly.bash

backup_directory="backup"

# Check if the backup directory exists, create it if it doesn't
if ! directoryExists "$backup_directory"; then
    mkdir "$backup_directory"
fi

# Prompt the user to select a file for backup
selected_file=$(fileSelector)

# Check if any file was selected
if [[ -n $selected_file ]]; then
    # Create a backup of the selected file in the backup directory
    cp "$selected_file" "$backup_directory"
    echo "File '$selected_file' backed up to '$backup_directory'."
else
    echo "No file selected for backup."
fi

