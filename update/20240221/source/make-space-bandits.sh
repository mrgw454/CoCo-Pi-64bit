#!/bin/bash

# install prerequisites
sudo apt -y install python3-wand

cd $HOME/source

# if a previous space-bandits folder exists, move into a date-time named folder

if [ -d "space-bandits" ]; then
	foldername=$(date +%Y-%m-%d_%H.%M.%S)
       	mv "space-bandits" "space-bandits-$foldername"

       	echo -e Archiving existing space-bandits folder ["space-bandits"] into backup folder ["space-bandits-$foldername"]
       	echo -e
       	echo -e
fi

# https://github.com/jamieleecho/space-bandits
git clone https://github.com/jamieleecho/space-bandits.git

cd space-bandits

GITREV=`git rev-parse --short HEAD`

make all

if [ $? -eq 0 ]
then
        echo "build process was successful"
        echo
else
        echo "build process was NOT successful.  Aborting."
        echo
	exit 1
fi

if [ ! -d /media/share1/SDC/CHO ]; then
	mkdir -p /media/share1/SDC/CHO
fi

find . -iname "*.dsk" -exec cp {} /media/share1/SDC/CHO \;


make clean
make all CPU=6309

if [ $? -eq 0 ]
then
        echo "build process was successful"
        echo
else
        echo "build process was NOT successful.  Aborting."
        echo
	exit 1
fi

if [ ! -d /media/share1/SDC/CHO ]; then
	mkdir -p /media/share1/SDC/CHO
fi

find . -iname "*.dsk" -exec cp {} /media/share1/SDC/CHO \;

cd ..


echo
echo Done!
