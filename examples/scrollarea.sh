#!/usr/bin/env bash

source ../friendly.bash

clear

getTermSize
setScrollArea 10 $(($termRows-5))
printAtLine 9 "=================================="
printAtLine $(($termRows-4)) "=================================="

printAtLine 5 "Printing 1 to 50"

gotoLine 10
for i in {1..50}
do
   echo "Line $i displaying the scroll area"
done

gotoLine $(($termRows-3)) && read -p "Press enter to continue"

printAtLine 5 "Printing 1 through 20"

gotoLine 10
for x in {1..20}
do 
  echo "Line $x displaying the scroll area"
done


gotoLine $(($termRows-3)) && read -p "Press enter to continue"


printAtLine 5 "Now listing files in current directory"
gotoLine $(($termRows-6))
ls -l

gotoLine $(($termRows-3)) && read -p "Press enter to continue"

releaseScrollArea
clear
