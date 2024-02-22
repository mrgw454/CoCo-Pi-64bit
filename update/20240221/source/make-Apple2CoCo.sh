#!/bin/bash

cd $HOME/source

# if a previous Apple2CoCo folder exists, move into a date-time named folder

if [ -d "Apple2CoCo" ]; then

       	foldername=$(date +%Y-%m-%d_%H.%M.%S)

       	mv "Apple2CoCo" "Apple2CoCo-$foldername"

       	echo -e Archiving existing Apple2CoCo folder ["Apple2CoCo"] into backup folder ["Apple2CoCo-$foldername"]
       	echo -e
       	echo -e
fi

# https://github.com/dragonbytes/Apple2CoCo
git clone https://github.com/dragonbytes/Apple2CoCo.git

cd Apple2CoCo

GITREV=`git rev-parse --short HEAD`

chmod a+x build_apple.sh
./build_apple.sh

if [ $? -eq 0 ]
then
        echo "Build was successful.  Continuing."
        echo
else
        echo "Build was NOT successful.  Aborting."
        echo
        exit 1
fi

echo Downloading APPLE2.ROM...
echo
wget https://mirrors.apple2.org.za/ftp.apple.asimov.net/emulators/rom_images/APPLE2_.ROM -O APPLE2.ROM

if [ -f APPLE2.ROM ]; then
	echo "Copying APPLE2.ROM to DSK image."
	echo
	decb copy -2 -b -r APPLE2.ROM apple2coco.dsk,APPLE2.ROM
else
	echo
	echo "APPLE2.ROM nout found.  Aborting."
	exit 1
fi

if [ ! -d /media/share1/SDC/WALLACE ]; then
	mkdir -p /media/share1/SDC/WALLACE
fi

cp apple2coco.dsk /media/share1/SDC/WALLACE/A2COCO.DSK

cd ..


echo
echo Done!

