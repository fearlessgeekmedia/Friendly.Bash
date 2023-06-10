#!/usr/bin/env bash

# Source Friendly.Bash
source ../friendly.bash

# Specify the file extension
extension="*.txt"

# Select files with the specified extension using fileSelector
selected_files=$(fileSelector / "$extension")

# Check if any files were selected
if [[ -n "$selected_files" ]]; then
  # Loop through the selected files
  for file in $selected_files; do
    # Check if the file exists
    if fileExists "$file"; then
      # Open the file using the default text editor
      if [[ -n "$EDITOR" ]]; then
        "$EDITOR" "$file"
      else
        echo "No default text editor specified. Set the \$EDITOR environment variable."
      fi
    else
      echo "File '$file' does not exist."
    fi
  done
else
  echo "No files selected."
fi
