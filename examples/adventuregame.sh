#!/usr/bin/env bash

# Source HumanBash
source ../friendly.bash

# Game data
game_file="game_data.txt"
current_room=""

# Function to save the game state
save_game() {
  echo "$current_room" > "$game_file"
  printAtLineCol 13 1 "Game saved successfully."
  sleep 2
}

# Function to load the game state
load_game() {
  if fileExists "$game_file"; then
    current_room=$(cat "$game_file")
    printAtLineCol 13 1 "Game loaded successfully."
    sleep 2
    clear
    run_room "$current_room"
  else
    printAtLineCol 13 1 "No saved game found."
    sleep 2
  fi
}

# Introduction
clear
printAtLine 1 "Welcome to the Adventure Game!"
printAtLineCol 3 5 "You find yourself in a mysterious land."
printAtLineCol 4 5 "Your goal is to find the treasure and escape."

# Room descriptions
room1() {
  clear
  printAtLineCol 6 1 "You enter Room 1."
  printAtLineCol 8 5 "There are three doors in front of you."
  printAtLineCol 9 5 "Which door do you choose? (1, 2, or 3)"
  printAtLine 10 "(s)ave game   (l)oad game"

  read -r choice
  case $choice in
    1)
      run_room room2
      ;;
    2)
      run_room room3
      ;;
    3)
      run_room room4
      ;;
    s|S)
      save_game
      printAtLineCol 11 1 "Game saved. Press enter to continue."
      read -r
      run_room room1
      ;;
    l|L)
      load_game
      run_room room1
      ;;
    *)
      printAtLineCol 11 1 "Invalid choice. Try again."
      run_room room1
      ;;
  esac
}

room2() {
  clear
  printAtLineCol 6 1 "You enter Room 2."
  printAtLineCol 8 5 "This room is filled with spiders."
  printAtLineCol 9 5 "What do you do? (1: Fight, 2: Run)"
  printAtLine 10 "(s)ave game   (l)oad game"

  read -r choice
  case $choice in
    1)
      printAtLineCol 11 1 "You defeat the spiders!"
      run_room room5
      ;;
    2)
      printAtLineCol 11 1 "You run away and return to Room 1."
      run_room room1
      ;;
    s|S)
      save_game
      printAtLineCol 13 1 "Game saved. Press enter to continue."
      read -r
      run_room room2
      ;;
    l|L)
      load_game
      run_room room2
      ;;
    *)
      printAtLineCol 11 1 "Invalid choice. Try again."
      run_room room2
      ;;
  esac
}

room3() {
  clear
  printAtLineCol 6 1 "You enter Room 3."
  printAtLineCol 8 5 "You encounter a locked door."
  printAtLineCol 9 5 "What is the secret password?"
  printAtLine 10 "(s)ave game   (l)oad game"

  read -r password
  if [[ $password == "open sesame" ]]; then
    printAtLineCol 12 5 "The door opens!"
    run_room room6
  else
    printAtLineCol 12 5 "Incorrect password. Try again."
    run_room room3
  fi
}

room4() {
  clear
  printAtLineCol 6 1 "You enter Room 4."
  printAtLineCol 8 5 "There is a treasure chest in the corner."
  printAtLineCol 9 5 "Do you open it? (y/n)"
  printAtLine 10 "(s)ave game   (l)oad game"

  read -r choice
  case $choice in
    y|Y)
      confirm "Are you sure you want to open the treasure chest?" && open_treasure_chest
      ;;
    n|N)
      printAtLineCol 11 1 "You leave the treasure chest untouched."
      run_room room1
      ;;
    s|S)
      save_game
      printAtLineCol 13 1 "Game saved. Press enter to continue."
      read -r
      run_room room4
      ;;
    l|L)
      load_game
      run_room room4
      ;;
    *)
      printAtLineCol 11 1 "Invalid choice. Try again."
      run_room room4
      ;;
  esac
}

open_treasure_chest() {
  printAtLineCol 11 1 "Congratulations! You found the treasure!"
  printAtLineCol 12 1 "You win the game!"
}

room5() {
  clear
  printAtLineCol 6 1 "You enter Room 5."
  printAtLineCol 8 5 "There is a magical portal in front of you."
  printAtLineCol 9 5 "Do you step into the portal? (y/n)"
  printAtLine 10 "(s)ave game   (l)oad game"

  read -r choice
  case $choice in
    y|Y)
      printAtLineCol 11 1 "You enter the portal and find yourself back in Room 1."
      run_room room1
      ;;
    n|N)
      printAtLineCol 11 1 "You decide not to enter the portal."
      run_room room1
      ;;
    s|S)
      save_game
      printAtLineCol 13 1 "Game saved. Press enter to continue."
      read -r
      run_room room5
      ;;
    l|L)
      load_game
      run_room room5
      ;;
    *)
      printAtLineCol 11 1 "Invalid choice. Try again."
      run_room room5
      ;;
  esac
}

room6() {
  clear
  printAtLineCol 6 1 "You enter Room 6."
  printAtLineCol 8 5 "This is the final room!"
  printAtLineCol 9 5 "Congratulations, you have escaped!"
  save_game
}

# Function to run a room based on its name
run_room() {
  local room_name=$1
  current_room=$room_name
  $room_name
}

# Start the game or load the saved game
if fileExists "$game_file"; then
  printAtLineCol 13 1 "Do you want to start a new game or load the saved game? (new/load)"

  read -r choice
  case $choice in
    new)
      run_room room1
      ;;
    load)
      load_game
      ;;
    *)
      printAtLineCol 15 1 "Invalid choice. Starting a new game."
      sleep 2
      run_room room1
      ;;
  esac
else
  run_room room1
fi
