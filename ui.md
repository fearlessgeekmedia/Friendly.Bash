# User Interface Functions

This section covers user interface functions that can be used to enhance the display and interaction in your bash scripts.

# progressBar

The progressBar function displays a progress bar.

** Note ** There are some issues with progressBar at this time and it may not work as expected. We currently treat this feature as experimental and it's possible it may be taken out of Friendy.Bash alltogether.

## Usage
`progressBar <progress>`

- <progress>: The current progress value, typically between 0 and 100. You can also pipe a command's output to display dynamic progress.

## Example
```
clear &&
progressBar 50
```

```
clear &&
ls -l | awk 'BEGIN {total = 0} {total += $5; print total}' | progressBar
```

In the second example, the output of the ls -l command is piped to awk to calculate the cumulative total of file sizes. The total is then piped to the progressBar function, which updates the progress bar based on the dynamically changing values.

Please note that you can pipe the output of any command that produces a numeric value or a series of numeric values into progressBar to visualize the progress.

Feel free to explore different use cases and combinations to create interactive and informative progress bars in your scripts!


# setScrollArea

The setScrollArea function sets a scrollable area on the terminal screen.

## Usage

setScrollArea <first_line> <last_line>

- <first_line>: The first line of the scrollable area.
- <last_line>: The last line of the scrollable area.

## Example
```
clear &&
setScrollArea 3 10
```

# releaseScrollArea

The releaseScrollArea function releases the scrollable area previously set using setScrollArea.

## Usage
`releaseScrollArea`

## Example
`releaseScrollArea`
