#!/bin/bash

cd $HOME/source

# if a previous ROTB folder exists, move into a date-time named folder

if [ -d "ROTB" ]; then
	foldername=$(date +%Y-%m-%d_%H.%M.%S)
       	mv "ROTB" "ROTB-$foldername"

       	echo -e Archiving existing ROTB folder ["ROTB"] into backup folder ["ROTB-$foldername"]
       	echo -e
       	echo -e
fi

# https://github.com/sorchard001/ROTB
git clone https://github.com/sorchard001/ROTB.git

cd ROTB

GITREV=`git rev-parse --short HEAD`

asm6809 -C -o ROTB.BIN rotb.asm

if [ $? -eq 0 ]
then
        echo "build process was successful"
        echo
else
        echo "build process was NOT successful.  Aborting."
        echo
	exit 1
fi

rm title_screen.bin
makeDSK-pyDW.sh

if [ ! -d /media/share1/SDC/SORCHARD ]; then
	mkdir -p /media/share1/SDC/SORCHARD
fi

find . -iname "*.dsk" -exec cp {} /media/share1/SDC/SORCHARD \;

cd ../..


echo
echo Done!
