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
