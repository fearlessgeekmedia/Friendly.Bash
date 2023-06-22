## File manipulation
# Replaces specified text in a file with new text.
replaceInFile() {
  local file="$1"
  local search="$2"
  local replace="$3"

  sed -i "s/${search}/${replace}/g" "$file"
}

# Checks to see if a file exists
fileExists() {
  local file_path=$1
  [[ -f "$file_path" ]]
}

# Checks to see if a directory exists
directoryExists() {
  local dir_path=$1
  [[ -d "$dir_path" ]]
}

# Extracts a column from a .csv file
extractColumn() {
  local file="$1"
  local column="$2"

  awk -F ',' "{print \$$column}" "$file"
}

# Filters lines of a file by a pattern
filterLines() {
  local file=$1
  local pattern=$2
  local separator=$3

  if [ "$separator" = "newline" ]; then
    separator='\n'  # Set separator to \n for "newline" option
  fi

  local filtered_lines=""
  while IFS= read -r line; do
    filtered_lines+="$line$separator"
  done < <(grep "$pattern" "$file")

  echo -n "$filtered_lines"
}
