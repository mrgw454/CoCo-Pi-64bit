#!/bin/bash

cd $HOME/source

# if a previous naken_asm folder exists, move into a date-time named folder

if [ -d "naken_asm" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "naken_asm" "naken_asm-$foldername"

        echo -e Archiving existing naken_asm folder ["naken_asm"] into backup folder ["naken_asm-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/mikeakohn/naken_asm
git clone https://github.com/mikeakohn/naken_asm.git

cd naken_asm

GITREV=`git rev-parse --short HEAD`

./configure
make

if [ -f naken_asm ]; then
	sudo make install
else
	echo binaries not found!
	echo
fi
cd ..

echo
echo Done!
