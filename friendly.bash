# This is a bash script library to help make bash scripting easier
# and more human-readable.
#
# I created this because I noticed there were certain things you 
# could do in Bash, such as escape commands, which are awesome to
# use, yet not very human-readable. I like a more human-readable
# language. 
#
# So this is basically a set of functions I'm using and making
# available to the public under the MIT license.

## Cursor Visibility

hideCursor() {
  printf '\e[?25l'
}

showCursor() {
  printf '\e[?25h'
}

## Line Wrapping

lineWrapping() {
  lwoption=$@
  if [ $lwoption = "enabled" ]; then
    printf '\e[?7h'
  elif [ $lwoption = "disabled" ]; then
    printf '\e[?7l'
  else
    printf "lineWrapping: Invalid option - $lwoption \n \
    \"enabled\" or \"disabled\" expected. \n"
  fi 
}
# Message and Cursor Placement
# Prints a message on a specified line
printAtLine() {
  local LINE=$1
  shift 1
  echo -e "\033[${LINE}H$@"
}

# Prints a message starting on a specific line and column
printAtLineCol() {
  local LINE=$1
  local COL=$2
  shift 2
  printf "\e[${LINE};${COL}H$@"
}

gotoLine() {
  local LINE=$1
  printf "\e[${LINE}H"
}

gotoLineCol() {
  local LINE=$1
  local COL=$2
  printf "\e[${LINE};${COL}H"
}

moveUp() {
  local LINES=$1
  printf "\e[${LINES}A"
}

moveDown() {
  local LINES=$1
  printf "\e[${LINES}B"
}

moveLeft() {
  local COLS=$1
  printf "\e[${COLS}D"
}

moveRight() {
  local COLS=$1
  printf "\e[${COLS}C"
}

# File Selector (will require fzf)
fileSelector() {
  local extension="*"
  local multi=""
  local directory="."

  # Join all arguments into a single string
  local args="$@"

  # Parse arguments
  if [[ "$@" == *"-m"* ]] || [[ "$@" == *"--multi"* ]]; then
    multi="--multi"
  fi
  
  for arg in "$@"; do
    if [[ $arg != -* ]]; then
      if [[ -d $arg ]]; then
        directory=$arg
      else
        extension=$arg
      fi
    fi
  done

  if command -v fzf >/dev/null 2>&1; then
    SelectedFiles=$(find "$directory" -type f -name "*$extension*" 2>/dev/null | fzf $multi --prompt 'Files:')
    echo "$SelectedFiles"
  else
    echo "FZF isn't installed."
  fi
}

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

# Confirmation prompt
confirm() {
  if [[ $@ ]]
    then
      confirmMessage="$@"
    else
      confirmMessage="Are you sure?"
  fi

  while true; do
    read -p "$confirmMessage [y/N]: " choice
    case "$choice" in
      y|Y )
        return 0;;
      n|N )
        return 1;;
      * )
        echo "Invalid input. Please enter 'y' for Yes or 'n' for No."
    esac
  done
}

# User Interface Functions

# Progress Bar
progressBar() {
  DIR=$(dirname -- "${BASH_SOURCE[0]}")
  DIR=$(realpath -e -- "$DIR")
  node "$DIR/progressbar.js" "$1"
}

setScrollArea() {
  FIRSTLINE=$1
  SECONDLINE=$2
  printf "\e[${FIRSTLINE};${SECONDLINE}r"
  gotoLine $1
}

releaseScrollArea() {
  printf "\e[;r"
}