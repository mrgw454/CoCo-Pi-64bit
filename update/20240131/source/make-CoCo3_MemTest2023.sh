#!/bin/bash

cd $HOME/source

# if a previous CoCo3_MemTest2023 folder exists, move into a date-time named folder

if [ -d "CoCo3_MemTest2023" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "CoCo3_MemTest2023" "CoCo3_MemTest2023-$foldername"

        echo -e Archiving existing CoCo3_MemTest2023 folder ["CoCo3_MemTest2023"] into backup folder ["CoCo3_MemTest2023-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/nowhereman999/CoCo3_MemTest2023
git clone https://github.com/nowhereman999/CoCo3_MemTest2023.git

cd CoCo3_MemTest2023

GITREV=`git rev-parse --short HEAD`


if [ -f MEMT2023.DSK ]; then
	if [ ! -d /media/share1/SDC/HEWLETT ]; then
		mkdir /media/share1/SDC/HEWLETT
	fi

	cp MEMT2023.DSK /media/share1/SDC/HEWLETT
else
	echo MEMT2023.DSK image not found!
	echo
fi

cd ..

echo
echo Done!

