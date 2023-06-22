## String Manipulation

# Convert string to Upper Case
toUpperCase() {
  usedString=$@
  echo "$usedString" | tr '[:lower:]' '[:upper:]'
}

# Convert string to Lower Case
toLowerCase() {
  usedString=$@
  echo "$usedString" | tr '[:upper:]' '[:lower:]'
}
