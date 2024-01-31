#!/bin/bash

cd $HOME/source

# if a previous 6809dasm folder exists, move into a date-time named folder

if [ -d "6809dasm" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "6809dasm" "6809dasm-$foldername"

        echo -e Archiving existing 6809dasm folder ["6809dasm"] into backup folder ["6809dasm-$foldername"]
        echo -e
        echo -e
fi

if [ ! -d 6809dasm ]; then
	mkdir 6809dasm
fi

cd 6809dasm

# https://www.6809.org.uk/dragon/6809dasm.pl
wget https://www.6809.org.uk/dragon/6809dasm.pl
wget https://www.6809.org.uk/dragon/6809dasm.txt

chmod a+x 6809dasm.pl

sudo cp 6809dasm.pl /usr/local/bin

cd ..

echo
echo Done!
