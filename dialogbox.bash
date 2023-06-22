# Creates a Dialog Box
dialogBox() {
  local title=""
  local message=""
  local buttons=()
  local buttonCodes=()

  # Parse arguments
  while [[ $# -gt 0 ]]; do
    case $1 in
      --title=*)
        title="${1#*=}"
        shift
        ;;
      --message=*)
        message="${1#*=}"
        shift
        ;;
      --button=*)
        local button="${1#*=}"
        local buttonLabel="${button%:*}"
        local buttonCode="${button#*:}"
        buttons+=("$buttonLabel")
        buttonCodes+=("$buttonCode")
        shift
        ;;
      *)
        shift
        ;;
    esac
  done

  local buttonCount="${#buttons[@]}"
  local selectedButton=0

  # Calculate dialog box dimensions
  getTermSize
  local dialogWidth=$((termColumns - 4))
  local dialogHeight=$((termRows - 4))

  # Calculate message position
  local messageLines=$(echo "$message" | fold -s -w $((dialogWidth - 2)))
  local messageHeight=$(echo "$messageLines" | wc -l)
  local messageStartLine=$(( (dialogHeight - messageHeight) / 2 ))

  # Print dialog box frame
  printAtLineCol $messageStartLine 1 "╔$(printf '═%.0s' $(seq 1 $((dialogWidth - 2))))╗"
  for ((line = 1; line <= dialogHeight; line++)); do
    printAtLineCol $((messageStartLine + line)) 1 "║$(printf ' %.0s' $(seq 1 $((dialogWidth - 2))))║"
  done
  printAtLineCol $((messageStartLine + dialogHeight + 1)) 1 "╚$(printf '═%.0s' $(seq 1 $((dialogWidth - 2))))╝"

  # Print title and message
  printAtLineCol $((messageStartLine + 1)) 2 "$title"
  local messageLineNum=1
  while IFS= read -r line; do
    printAtLineCol $((messageStartLine + 3 + messageLineNum)) 2 "$line"
    ((messageLineNum++))
  done <<< "$messageLines"

  # Print buttons
  local buttonStartCol=$(( (dialogWidth - buttonCount * 10) / 2 ))
  for ((i = 0; i < buttonCount; i++)); do
    local buttonLabel="${buttons[i]}"
    printAtLineCol $((messageStartLine + dialogHeight + 4)) $((buttonStartCol + i * 10)) "[${buttonLabel}]"
    if [[ $i -eq $selectedButton ]]; then
      printAtLineCol $((messageStartLine + dialogHeight + 4)) $((buttonStartCol + i * 10)) "[$(tput smso)${buttonLabel}$(tput rmso)]"
    fi
  done

  # Hide cursor and wait for user input
  hideCursor
  local key
  while true; do
    IFS= read -rsn1 key
    case "$key" in
      $'\x1b')  # Escape sequence
        IFS= read -rsn2 -t 0.01 key  # Read additional characters of escape sequence
        case "$key" in
          '[A')  # Up arrow
            selectedButton=$(( (selectedButton - 1 + buttonCount) % buttonCount ))
            ;;
          '[B')  # Down arrow
            selectedButton=$(( (selectedButton + 1) % buttonCount ))
            ;;
          '[D')  # Left arrow
            selectedButton=$(( (selectedButton - 1 + buttonCount) % buttonCount ))
            ;;
          '[C')  # Right arrow
            selectedButton=$(( (selectedButton + 1) % buttonCount ))
            ;;
          '[Z')  # Shift+Tab
            selectedButton=$(( (selectedButton - 1 + buttonCount) % buttonCount ))
            ;;
        esac
        ;;
      $'\x09')  # Tab
        selectedButton=$(( (selectedButton + 1) % buttonCount ))
        ;;
      '')  # Enter
        break
        ;;
    esac

    # Print buttons with correct highlighting
    for ((i = 0; i < buttonCount; i++)); do
      if [[ $i -eq $selectedButton ]]; then
        printAtLineCol $((messageStartLine + dialogHeight + 4)) $((buttonStartCol + i * 10)) "[$(tput smso)${buttons[i]}$(tput rmso)]"
      else
        printAtLineCol $((messageStartLine + dialogHeight + 4)) $((buttonStartCol + i * 10)) "[${buttons[i]}]"
      fi
    done
  done

  # Show cursor
  showCursor

  # Return the selected button's code as the exit code
  return ${buttonCodes[selectedButton]}
}
