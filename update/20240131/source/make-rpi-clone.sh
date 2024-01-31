#!/bin/bash

cd $HOME/source

# if a previous rpi-clone folder exists, move into a date-time named folder

if [ -d "rpi-clone" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "rpi-clone" "rpi-clone-$foldername"

        echo -e Archiving existing rpi-clone folder ["rpi-clone"] into backup folder ["rpi-clone-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/billw2/rpi-clone.git
git clone https://github.com/billw2/rpi-clone.git


GITREV=`git rev-parse --short HEAD`

echo
echo Done!

