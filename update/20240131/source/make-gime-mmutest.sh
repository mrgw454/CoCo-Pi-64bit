#!/bin/bash

cd $HOME/source

# if a previous gime-mmutest folder exists, move into a date-time named folder

if [ -d "gime-mmutest" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "gime-mmutest" "gime-mmutest-$foldername"

        echo -e Archiving existing gime-mmutest folder ["gime-mmutest"] into backup folder ["gime-mmutest-$foldername"]
        echo -e
        echo -e
fi

# https://gitlab.com/m6809-computer-tools/gime-mmutest
git clone https://gitlab.com/m6809-computer-tools/gime-mmutest.git

cd gime-mmutest

GITREV=`git rev-parse --short HEAD`


lwasm --6809 --decb --output=mmutest.bin mmutest.asm

if [ -f mmutest.bin ]; then
	echo mmutest.bin binary found
	echo
else
	echo mmutest.bin binary NOT found.  Aborting.
	echo
	exit 1
fi


makeDSK-pyDW.sh

if [ -f gime-mmutest.DSK ]; then
	if [ ! -d /media/share1/SDC/TORMOD ]; then
		mkdir /media/share1/SDC/TORMOD
	fi
	echo "cp gime-mmutest.DSK /media/share1/SDC/TORMOD/MMUTEST.DSK"
	echo
	cp gime-mmutest.DSK /media/share1/SDC/TORMOD/MMUTEST.DSK
fi

makewav -c -r -nMMUTEST -ommutest.wav mmutest.bin -v

if [ -f mmutest.wav ]; then
	if [ ! -d /media/share1/cassette/TORMOD ]; then
		mkdir /media/share1/cassette/TORMOD
	fi
	echo "cp mmutest.wav /media/share1/cassette/TORMOD"
	echo
	cp mmutest.wav /media/share1/cassette/TORMOD
fi


cd ..

echo
echo Done!
