# Table Formatting

The friendly.bash library provides functions for formatting tables to display data in a structured manner.

## formatTableHeader
`formatTableHeader [column1] [column2] ... [columnN] [column_width]`

Formats the table header with the specified column names. The optional column_width parameter sets the width for each column. If not provided, the default column width is 15 characters.

```
header=$(formatTableHeader "Name" "Age" "Country" 20)
echo "$header"
```

Output:
`Name               Age                Country`

## formatTableRow

`formatTableRow [value1] [value2] ... [valueN] [column_width]`

Formats a row in the table with the specified values. The optional column_width parameter sets the width for each column. If not provided, the default column width is 15 characters.

Example usage:
```
row=$(formatTableRow "John Doe" "25" "USA" 20)
echo "$row"
```

Output:
`John Doe           25                 USA`

## printTableSeparator
`printTableSeparator [num_columns] [column_width]`

Prints a separator line to visually separate table rows. The num_columns parameter specifies the number of columns in the table, and the optional column_width parameter sets the width for each column. If not provided, the default column width is 15 characters.

Example usage:
`printTableSeparator 3 20`

Output:

`==================== ==================== ====================`