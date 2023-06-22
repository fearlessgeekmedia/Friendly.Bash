#!/bin/bash

# Include the friendly.bash file
source ../friendly.bash

# Call the dialogBox function with custom buttons
dialogBox --title="Title" --message="This is a sample message." --button="Yes":0 --button="No":1 --button="Maybe":2 --button="Go Crazy":3

# After the dialog box is closed, you can handle the selected button
exitCode=$?
echo -e "\n\n"
case $exitCode in
  0)
    echo "User selected 'Yes'"
    ;;
  1)
    echo "User selected 'No'"
    ;;
  2)
    echo "User selected 'Maybe'"
    ;;
  3)
    echo "User wants to go crazy!"
    ;;
  *)
    echo "Invalid exit code: $exitCode"
    ;;
esac

# The script continues...
echo "Script continues..."
