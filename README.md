# Friendly.Bash
Friendly.Bash is a bash script library designed to make bash scripting easier and more human-readable. It provides a collection of functions that simplify common tasks and improve the overall readability of your scripts.

## Motivation
Bash scripting is a powerful tool, but sometimes the syntax and constructs can be difficult to read and understand. Friendly.Bash aims to address this issue by offering a set of functions that provide more intuitive and human-readable alternatives for common bash operations.

## Dependencies

### Optional Dependencies
- fzf (needed for the File Selector)
- find/mlocate (needed for the File Selector)
- node (needed for Progress Bar)

## Features
Friendly.Bash includes the following features:

- Message Placement: Functions for printing messages at specific lines or line/column positions on the terminal.
- File Selector: Interactive file selection using fzf (requires fzf to be installed).
- File Manipulation
-- Check if a file exists using the fileExists function.
-- Check if a directory exists using the directoryExists function
-- Text Replacement: Easily replace specified text in a file.
- CSV Column Extraction: Extract a specific column from a CSV file.
- Line Filtering: Filter lines of a file based on a given pattern.
- Confirmation Prompt: Simple confirmation prompt for user interaction.
- Progress Bar: Display a progress bar on the command line.
- Installation

More features coming soon! This is still in early development.

## Clone the Friendly.Bash repository:

`git clone https://github.com/fearlessgeekmedia.com/Freindly.Bash`
Source the Friendly.Bash script in your own bash script:

`source /path/to/friendly.bash`

## Usage
To use Friendly.Bash functions in your bash scripts, simply source the Friendly.Bash script and call the desired function. Here's an example:

```
#!/usr/bin/env bash

#Source Friendly.Bash
source /path/to/friendly.bash

#Print a message at line 1
printAtLine 1 "Hello, world!"

#Replace text in a file
replaceInFile "file.txt" "old-text" "new-text"

# Interactive file selection
selected_file=$(fileSelector)
echo "You selected: $selected_file"

# Check if a file exists
if fileExists "file.txt"; then
  echo "File exists!"
else
  echo "File does not exist."
fi

# Check if a directory exists
if directoryExists "directory"; then
  echo "Directory exists!"
else
  echo "Directory does not exist."
fi

#Extract column from a CSV file
extractColumn "data.csv" 2

#Filter lines of a file by a pattern
filterLines "file.txt" "pattern" "newline"

#Display a confirmation prompt
confirm "Are you sure?"

#Display a progress bar
progressBar 50 

#Display a progress bar while running a command
sleep 5 | progressBar #Note that without the number, a percentage of progress will not be displayed.
```
## fileSelector

Interactive file selection using fzf.

### Usage

`fileSelector [options] [directory] [extension]`

###Options
-m or --multi: Enable multi-file selection.
Arguments
directory (optional): The directory to search for files. If not provided, the current directory is used.
extension (optional): The file extension to filter files. If not provided, all files are shown.
Examples
Select a single file with a specific extension:
`selected_file=$(fileSelector .txt)`

Select multiple files with a specific extension:
`selected_files=$(fileSelector -m .txt)`

Search for files in a specific directory:
`selected_file=$(fileSelector /path/to/directory)`

Search for files with a specific extension in a specific directory:
`selected_file=$(fileSelector /path/to/directory .txt)`

Enable multi-file selection in a specific directory:
`selected_files=$(fileSelector -m /path/to/directory)`
Note: The fileSelector function requires the fzf utility as well as find to be installed on your system.

Please refer to the function descriptions within the friendly.bash script for more details on each function's usage and parameters.

## License
Friendly.Bash is released under the MIT License. See the LICENSE file for more information.

## Contributing
Contributions are welcome! If you have any ideas, bug reports, or feature requests, please open an issue or submit a pull request on the Friendly.Bash repository.
