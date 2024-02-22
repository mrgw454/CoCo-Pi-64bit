#!/bin/bash

cd $HOME/source

# if a previous CoCoIO folder exists, move into a date-time named folder

if [ -d "CoCoIO" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "CoCoIO" "CoCoIO-$foldername"

        echo -e Archiving existing CoCoIO folder ["CoCoIO"] into backup folder ["CoCoIO-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/rickulland/CoCoIO
git clone https://github.com/rickulland/CoCoIO.git

cd CoCoIO

GITREV=`git rev-parse --short HEAD`

cd ..

echo
echo Done!

