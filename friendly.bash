# This is a bash script library to help make bash scripting easier
# and more human-readable.
#
# I created this because I noticed there were certain things you 
# could do in Bash, such as escape commands, which are awesome to
# use, yet not very human-readable. I like a more human-readable
# language. 
#
# So this is basically a set of functions I'm using and making
# available to the public under the MIT license.

DIR=$(dirname -- "${BASH_SOURCE[0]}")
 DIR=$(realpath -e -- "$DIR")

source $DIR/misc.bash
source $DIR/stringmanipulation.bash
source $DIR/tableformatting.bash
source $DIR/cursorvisibility.bash
source $DIR/linewrapping.bash
source $DIR/placement.bash
source $DIR/fileselector.bash
source $DIR/filemanipulation.bash
source $DIR/confirm.bash
source $DIR/ui.bash
source $DIR/dialogbox.bash
