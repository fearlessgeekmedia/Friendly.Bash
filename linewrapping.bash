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
