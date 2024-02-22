#!/bin/bash

# install prerequisites
echo NOTE!  This is for use with the NoICE debugger:
echo
echo -e "https://www.noicedebugger.com/"
echo
echo
read -p "Press any key to continue... " -n1 -s
echo
echo

cd $HOME/source

# if a previous moncoco-NoICE folder exists, move into a date-time named folder

if [ -d "moncoco-NoICE" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "moncoco-NoICE" "moncoco-NoICE-$foldername"

        echo -e Archiving existing moncoco-NoICE folder ["moncoco-NoICE"] into backup folder ["moncoco-NoICE-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/n6il/moncoco
git clone https://github.com/n6il/moncoco.git moncoco-NoICE

cd moncoco-NoICE

make
if [ $? -eq 0 ]
then
        echo "Compilation was successful"
        echo
else
        echo "Compilation was NOT successful"
        echo
        exit 1
fi

if [ ! -d /media/share1/SDC/FURMAN/NOICE ]; then
	mkdir -p /media/share1/SDC/FURMAN/NOICE
fi

cp noice.dsk /media/share1/SDC/FURMAN/NOICE

cd ..


echo
echo Done!

