#!/bin/bash

source ../friendly.bash

# Read the CSV file
read_csv() {
  local file=$1
  cat "$file"
}

# Extract selected columns from the CSV
extract_columns() {
  local file=$1
  shift
  local columns=("$@")

  for column in "${columns[@]}"; do
    extractColumn "$file" "$column"
  done
}

# Prompt the user to select columns
prompt_column_selection() {
  local file=$1
  local columns=()

  local header=$(head -n 1 "$file")
  IFS=',' read -ra header_columns <<< "$header"

  # Use fzf to prompt the user for column selection
  columns=($(printf '%s\n' "${header_columns[@]}" | fzf -m))

  # Get the column numbers based on column names
  local column_numbers=()
  for column in "${columns[@]}"; do
    for i in "${!header_columns[@]}"; do
      if [[ "${header_columns[i],,}" == "${column,,}"* ]]; then
          column_numbers+=("$((i + 1))")
        break
      fi
    done
  done

  # Extract the selected columns
  local extracted_columns=()
  for column_number in "${column_numbers[@]}"; do
    extracted_columns+=("$(extractColumn "$file" "$column_number")")
  done

  # Get the maximum number of lines in extracted columns
  local max_lines=0
  for column_data in "${extracted_columns[@]}"; do
    local num_lines=$(echo "$column_data" | wc -l)
    if ((num_lines > max_lines)); then
      max_lines=$num_lines
    fi
  done

  # Calculate the maximum width for each column
  local column_width=15

  # Print the data in columns
  local first_iteration=true
  for ((i = 1; i <= max_lines; i++)); do
    local formatted_data=""
    for column_data in "${extracted_columns[@]}"; do
      local line=$(echo "$column_data" | sed -n "${i}p")
      formatted_data+=$(printf '%-*s' "$column_width" "$line")
    done

    # Skip the first line of data
    if $first_iteration; then
      first_iteration=false
      echo "$formatted_data"
      echo "================================================================================"
      continue
    fi

    echo "$formatted_data"
  done

  echo
}

# Main script

# Select the CSV file
file=$(fileSelector "*.csv" "/" -m)

if [ -n "$file" ]; then
  # Prompt the user for column selection
  prompt_column_selection "$file"
else
  echo "No CSV file selected."
fi
