#!/bin/bash

cd $HOME/source

# if a previous Star-Spores_CoCo folder exists, move into a date-time named folder

if [ -d "Star-Spores_CoCo" ]; then
	foldername=$(date +%Y-%m-%d_%H.%M.%S)
       	mv "Star-Spores_CoCo" "Star-Spores_CoCo-$foldername"

       	echo -e Archiving existing Star-Spores_CoCo folder ["Star-Spores_CoCo"] into backup folder ["Star-Spores_CoCo-$foldername"]
       	echo -e
       	echo -e
fi

# https://github.com/dshadoff/Star-Spores_CoCo
git clone https://github.com/dshadoff/Star-Spores_CoCo.git

cd Star-Spores_CoCo

GITREV=`git rev-parse --short HEAD`

mv src/cross-asm src/STARSPOR

cd src/STARSPOR

cp asm.bat asm.sh
chmod a+x asm.sh
./asm.sh

if [ $? -eq 0 ]
then
        echo "build process was successful"
        echo
else
        echo "build process was NOT successful.  Aborting."
        echo
	exit 1
fi

makeDSK-pyDW.sh

if [ ! -d /media/share1/SDC/DSHADOFF ]; then
	mkdir -p /media/share1/SDC/DSHADOFF
fi

find . -iname "*.dsk" -exec cp {} /media/share1/SDC/DSHADOFF \;

cd ../..


echo
echo Done!
