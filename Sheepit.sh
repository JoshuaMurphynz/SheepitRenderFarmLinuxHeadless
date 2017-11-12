#!/bin/bash
# Script to Download and run Sheepit render client
# By Josh
# Version .05

# Possible additions: Add Colours

# Variables
UsernameVariable=""
PasswordVariable=""

# Functions
function waitFunction {
sleep .9
}

# Actual code

printf "How many cores do you want to use, you have the option of using: "
grep -c ^processor /proc/cpuinfo
read -r NoC
echo "Sweet, using $NoC cores"
waitFunction
echo "Alright, making a folder"
cd /tmp || exit
echo "Check if it exists first"
if [ ! -d sheepitfolder ] ; then
	mkdir sheepitfolder
	echo "It doesn't let me make it"
fi
waitFunction
echo "Let's go into it"
cd sheepitfolder || exit
waitFunction
echo "Let's make a temp folder for this terminal session only"
TEMP=$(mktemp /tmp/sheepit_randomfolder.XXXXXXXX --directory)
cd ${TEMP} || exit
waitFunction
echo "Done"
waitFunction
echo "Now to download the client"
wget --quiet -O sheepit-clientTMPLATEST.jar https://www.sheepit-renderfarm.com/media/applet/client-latest.php
echo "Finished downloading"
java -jar sheepit-clientTMPLATEST.jar --version
waitFunction
echo "Ready"
waitFunction
echo "Ctrl + C to stop"
mkdir /tmp/sheepit-cache
java -jar sheepit-clientTMPLATEST.jar -login "$UsernameVariable" -password "$PasswordVariable" -ui text -cores "$NoC" -cache-dir /tmp/sheepit-cache
cd
exit
