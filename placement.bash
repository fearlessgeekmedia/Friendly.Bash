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
