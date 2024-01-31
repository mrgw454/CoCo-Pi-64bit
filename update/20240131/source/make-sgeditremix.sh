#!/bin/bash

cd $HOME/source

# if a previous sgeditremix folder exists, move into a date-time named folder

if [ -d "sgeditremix" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "sgeditremix" "sgeditremix-$foldername"

        echo -e Archiving existing sgeditremix folder ["sgeditremix"] into backup folder ["sgeditremix-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/daftspaniel/sgeditremix
git clone https://github.com/daftspaniel/sgeditremix.git

cd sgeditremix

GITREV=`git rev-parse --short HEAD`

cd ..

echo
echo Done!

