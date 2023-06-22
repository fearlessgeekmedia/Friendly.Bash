
## Table Formatting

# Format Table Header

formatTableHeader() {
  local columns=("$@")
  local column_width=${columns[-1]}  # Get the last argument as column width
  if [[ $column_width =~ ^[0-9]+$ ]]; then
    unset columns[-1]                  # Remove the last argument from the array
  else
    column_width=15                     # Use default width of 15
  fi
  local formatted_header=""

  for column in "${columns[@]}"; do
    formatted_header+=$(printf '%-*s' "$column_width" "$column")
  done

  echo "$formatted_header"
}

#Format Table Row

formatTableRow() {
  local row_values=("$@")
  local column_width=${row_values[-1]}  # Get the last argument as column width
  if [[ $column_width =~ ^[0-9]+$ ]]; then
    unset row_values[-1]                  # Remove the last argument from the array
  else
    column_width=15                       # Use default width of 15
  fi
  local formatted_row=""

  for value in "${row_values[@]}"; do
    formatted_row+=$(printf '%-*s' "$column_width" "$value")
  done

  echo "$formatted_row"
}

# Print Table Separator

printTableSeparator() {
  local num_columns=$1
  local column_width=${2:-15}

  local separator=""
  local total_width=$((num_columns * (column_width + 3) - 3))

  for ((i = 1; i <= total_width; i++)); do
    separator+="="
  done

  echo "$separator"
}
