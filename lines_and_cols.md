# Lines and Columns

# lineWrapping

The lineWrapping function allows you to enable or disable line wrapping in the terminal. Line wrapping determines whether long lines of text should wrap to the next line or continue horizontally beyond the visible area.

## Usage

`lineWrapping <option>`

Options
- enabled: Enables line wrapping.
- disabled: Disables line wrapping.

## Example 
`lineWrapping enabled`

# printAtLine

The printAtLine function is used to print a message on a specified line in the terminal. It allows you to position text output at a specific line number.

`printAtLine <line_number> <message>`

## Example

`clear && printAtLine 5 "Hello, World!"`

# printAtLineCol

The printAtLineCol function is used to print a message starting on a specific line and column in the terminal. It allows you to position text output at a specific line and column number.

## Usage

`printAtLineCol <line_number> <column_number> <message>`

## Example
`clear && printAtLineCol 5 10 "Hello, World!"`

# gotoLine

The gotoLine function is used to move the cursor to a specific line in the terminal. It allows you to jump to a particular line number.

## Usage
`gotoLine <line_number>`

## Example
`clear && gotoLine 5`

# gotoLineCol

The gotoLineCol function is used to move the cursor to a specific line and column in the terminal. It allows you to position the cursor at a particular line and column number.

## Usage
`gotoLineCol <line_number> <column_number>`

## Example
`clear && gotoLineCol 5 10`

moveUp

The moveUp function is used to move the cursor up a specified number of lines in the terminal.

## Usage
`moveUp <number_of_lines>`

## Example
`clear && moveUp 3`

# movedDown

The moveDown function is used to move the cursor down a specified number of lines in the terminal.

## Usage
`moveDown <number_of_lines>`

## Example
`clear && moveDown 3`

# moveLeft

The moveLeft function is used to move the cursor left a specified number of columns in the terminal.

## Usage
`moveLeft <number_of_columns>`

## Example
`clear && moveLeft 5`

# moveRight

The moveRight function is used to move the cursor right a specified number of columns in the terminal.

## Usage
`moveRight <number_of_columns>`

## Example
`clear && moveRight 5`