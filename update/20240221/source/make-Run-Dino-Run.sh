#!/bin/bash

cd $HOME/source

# if a previous Run-Dino-Run folder exists, move into a date-time named folder

if [ -d "Run-Dino-Run" ]; then
	foldername=$(date +%Y-%m-%d_%H.%M.%S)
       	mv "Run-Dino-Run" "Run-Dino-Run-$foldername"

       	echo -e Archiving existing Run-Dino-Run folder ["Run-Dino-Run"] into backup folder ["Run-Dino-Run-$foldername"]
       	echo -e
       	echo -e
fi

# https://github.com/pfiscarelli/Run-Dino-Run
git clone https://github.com/pfiscarelli/Run-Dino-Run.git

cd Run-Dino-Run

GITREV=`git rev-parse --short HEAD`

cd src

sed -i 's/.\\include\\dinorun\\/.\/include\//' dinorun.asm

lwasm dinorun.asm --6809 --symbols --6800compat --output=dinorun.bin --format=decb

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
mv src.DSK DINORUN.DSK

if [ ! -d /media/share1/SDC/FISCAREL ]; then
	mkdir -p /media/share1/SDC/FISCAREL
fi

find . -iname "*.dsk" -exec cp {} /media/share1/SDC/FISCAREL \;

cd ../..


echo
echo Done!
