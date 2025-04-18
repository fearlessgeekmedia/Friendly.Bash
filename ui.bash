# User Interface Functions

# Progress Bar
progressBar() {
  DIR=$(dirname -- "${BASH_SOURCE[0]}")
  DIR=$(realpath -e -- "$DIR")
  node "$DIR/progressbar.js" "$1"
}

# Sets a scroll area
setScrollArea() {
  FIRSTLINE=$1
  SECONDLINE=$2
  printf "\e[${FIRSTLINE};${SECONDLINE}r"
  gotoLine $1
}


# Releases the scroll area
releaseScrollArea() {
  printf "\e[;r"
}


hr() {
  # Get the terminal width
  width=$(tput cols)

  # Print a line of underscores
  printf '%*s\n' "$width" '' | tr ' ' '─'
}


dhr() {
  # Get the terminal width
  width=$(tput cols)

  # Print a line of underscores
  printf '%*s\n' "$width" '' | tr ' ' '═'

}
