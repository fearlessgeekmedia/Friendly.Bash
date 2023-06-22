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
