# File Manipulation

This section covers various file manipulation functions that can be useful in bash scripting.

# ReplaceInFile

The replaceInFile function replaces specified text in a file with new text.

## Usage
`replaceInFile <file> <search> <replace>`

- <file>: The path to the file where the replacement should be performed.
- <search>: The text to search for in the file.
- <replace>: The text to replace the matched occurrences with.

## Example
`replaceInFile file.txt "foo" "bar"`

# fileExists

The fileExists function checks if a file exists.

## Usage
`fileExists <file_path>`

- <file_path>: The path to the file to check.
Returns
- 0 if the file exists.
- 1 if the file does not exist.

## Example 
```
if fileExists file.txt; then
  echo "File exists"
else
  echo "File does not exist"
fi

```

# directoryExists

The directoryExists function checks if a directory exists.

## Usage
`directoryExists <dir_path>`

<dir_path>: The path to the directory to check.
Returns
0 if the directory exists.
1 if the directory does not exist.

## Example

```
if directoryExists /path/to/directory; then
  echo "Directory exists"
else
  echo "Directory does not exist"
fi

```

# extractColumn

The extractColumn function extracts a column from a CSV file.

## Usage
`extractColumn <file> <column>`

- <file>: The path to the CSV file.
- <column>: The column number to extract.

## Example
`extractColumn data.csv 2`

# filterLines
The filterLines function filters lines of a file by a pattern.

## Usage
`filterLines <file> <pattern> <separator>`

- <file>: The path to the file.
- <pattern>: The pattern to filter the lines by.
- <separator>: The separator to use for the filtered lines. Use "newline" for a newline-separated output.

## Example
`filterLines file.txt "pattern" ","`