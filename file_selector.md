# File Selection

# fileSelector

The fileSelector function allows you to interactively select files using the fzf command-line fuzzy finder tool. It provides a convenient way to browse and select files from a specified directory based on file extensions.

## Usage
`fileSelector [options] [directory]`

Options
- -m, --multi: Enables multi-selection mode, allowing the selection of multiple files.
- [directory]: Specifies the directory to search for files. If not provided, the current directory is used.
## Examples
Selecting a single file

```
selectedFile=$(fileSelector)
echo "Selected file: $selectedFile"

```

Selecting muoltiple files
```
selectedFiles=$(fileSelector -m)
echo "Selected files:"
echo "$selectedFiles"

```

Specifying a directory and file extension
```
selectedFile=$(fileSelector -m /path/to/directory "*.txt")
echo "Selected file: $selectedFile"
```

## Requirements
The fileSelector function requires the fzf command-line fuzzy finder tool to be installed. You can check if fzf is installed by running the following command:

`command -v fzf >/dev/null 2>&1`

If fzf is not found, you will need to install it before using the fileSelector function.