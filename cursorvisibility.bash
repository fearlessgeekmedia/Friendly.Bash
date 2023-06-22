## Cursor Visibility

hideCursor() {
  printf '\e[?25l'
}

showCursor() {
  printf '\e[?25h'
}
