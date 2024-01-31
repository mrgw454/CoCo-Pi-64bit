#!/bin/bash

cd $HOME/source

# if a previous mc-10 folder exists, move into a date-time named folder

if [ -d "mc-10" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "mc-10" "mc-10-$foldername"

        echo -e Archiving existing mc-10 folder ["mc-10"] into backup folder ["mc-10-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/gregdionne/mc-10
git clone https://github.com/gregdionne/mc-10.git

echo
echo Done!

