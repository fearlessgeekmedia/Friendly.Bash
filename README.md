# HumanBash
HumanBash is a bash script library designed to make bash scripting easier and more human-readable. It provides a collection of functions that simplify common tasks and improve the overall readability of your scripts.

## Motivation
Bash scripting is a powerful tool, but sometimes the syntax and constructs can be difficult to read and understand. HumanBash aims to address this issue by offering a set of functions that provide more intuitive and human-readable alternatives for common bash operations.

## Dependencies

### Optional Dependencies
- fzf (needed for the File Selector)

## Features
HumanBash includes the following features:

- Message Placement: Functions for printing messages at specific lines or line/column positions on the terminal.
- File Selector: Interactive file selection using fzf (requires fzf to be installed).
- Text Replacement: Easily replace specified text in a file.
- CSV Column Extraction: Extract a specific column from a CSV file.
- Line Filtering: Filter lines of a file based on a given pattern.
- Confirmation Prompt: Simple confirmation prompt for user interaction.
- Progress Bar: Display a progress bar on the command line.
- Installation

More features coming soon! This is still in early development.

## Clone the HumanBash repository:

`git clone https://github.com/your-username/humanbash.git`
Source the humanbash.sh script in your own bash script:

`source /path/to/humanbash/humanbash.sh`

## Usage
To use HumanBash functions in your bash scripts, simply source the humanbash.sh script and call the desired function. Here's an example:

`#!/usr/bin/env bash

# Source HumanBash
source /path/to/humanbash/humanbash.sh

# Print a message at line 1
printAtLine 1 "Hello, world!"

# Replace text in a file
replaceInFile "file.txt" "old-text" "new-text"

# Extract column from a CSV file
extractColumn "data.csv" 2

# Filter lines of a file by a pattern
filterLines "file.txt" "pattern" "newline"

# Display a confirmation prompt
confirm "Are you sure?"

# Display a progress bar
progressBar 50 

# Display a progress bar while running a command
sleep 5 | progressBar # Note that without the number, a percentage of progress will not be displayed.`

Please refer to the function descriptions within the humanbash.sh script for more details on each function's usage and parameters.

## License
HumanBash is released under the MIT License. See the LICENSE file for more information.

## Contributing
Contributions are welcome! If you have any ideas, bug reports, or feature requests, please open an issue or submit a pull request on the HumanBash repository.