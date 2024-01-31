#!/bin/bash

cd $HOME/source

# if a previous bogomips folder exists, move into a date-time named folder

if [ -d "bogomips" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "bogomips" "bogomips-$foldername"

        echo -e Archiving existing bogomips folder ["bogomips"] into backup folder ["bogomips-$foldername"]
        echo -e
        echo -e
fi

# https://gitlab.com/m6809-computer-tools/various-6809
git clone https://gitlab.com/m6809-computer-tools/various-6809.git bogomips

cd bogomips

GITREV=`git rev-parse --short HEAD`


lwasm --6809 --decb --output=bogomips.bin bogomips.asm

if [ -f bogomips.bin ]; then
	echo bogomips.bin binary found
	echo
else
	echo bogomips.bin binary NOT found.  Aborting.
	echo
	exit 1
fi


makeDSK-pyDW.sh

if [ -f bogomips.DSK ]; then
	if [ ! -d /media/share1/SDC/TORMOD ]; then
		mkdir /media/share1/SDC/TORMOD
	fi
	echo "cp bogomips.DSK /media/share1/SDC/TORMOD/bogomips.DSK"
	echo
	cp bogomips.DSK /media/share1/SDC/TORMOD/bogomips.DSK
fi

makewav -c -r -nbogomips -obogomips.wav bogomips.bin -v

if [ -f bogomips.wav ]; then
	if [ ! -d /media/share1/cassette/TORMOD ]; then
		mkdir /media/share1/cassette/TORMOD
	fi
	echo "cp bogomips.wav /media/share1/cassette/TORMOD"
	echo
	cp bogomips.wav /media/share1/cassette/TORMOD
fi


cd ..

echo
echo Done!
