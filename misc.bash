## Misc

# Getting the terminal size

getTermSize() {
  local size=$(stty size)
  termRows=${size% *}
  termColumns=${size#* }
}