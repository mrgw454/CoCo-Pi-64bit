#!/bin/bash

cd $HOME/source

# if a previous HiRes-Interface-Test folder exists, move into a date-time named folder

if [ -d "HiRes-Interface-Test" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "HiRes-Interface-Test" "HiRes-Interface-Test-$foldername"

        echo -e Archiving existing HiRes-Interface-Test folder ["HiRes-Interface-Test"] into backup folder ["HiRes-Interface-Test-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/tlindner/HiRes-Interface-Test
git clone https://github.com/tlindner/HiRes-Interface-Test.git

cd HiRes-Interface-Test

GITREV=`git rev-parse --short HEAD`

./build.sh

if [ -f joy.dsk ]; then
	if [ ! -d /media/share1/SDC/LINDNER ]; then
		mkdir /media/share1/SDC/LINDNER
	fi

	cp joy.dsk /media/share1/SDC/LINDNER
else
	echo joy.dsk image not found!
	echo
fi

cd ..

echo
echo Done!

