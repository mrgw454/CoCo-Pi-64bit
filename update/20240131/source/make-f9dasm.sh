#!/bin/bash

cd $HOME/source

# if a previous f9dasm folder exists, move into a date-time named folder

if [ -d "f9dasm" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "f9dasm" "f9dasm-$foldername"

        echo -e Archiving existing f9dasm folder ["f9dasm"] into backup folder ["f9dasm-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/Arakula/f9dasm
git clone https://github.com/Arakula/f9dasm.git

cd f9dasm

GITREV=`git rev-parse --short HEAD`

make

sudo cp f9dasm /usr/local/bin
sudo cp hex2bin /usr/local/bin
sudo cp mot2bin /usr/local/bin
sudo cp cmd2mot /usr/local/bin

cd ..

echo
echo Done!

