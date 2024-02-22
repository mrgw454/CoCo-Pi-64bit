#!/bin/bash

cd $HOME/source

# if a previous CoCo-www folder exists, move into a date-time named folder

if [ -d "CoCo-www" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "CoCo-www" "CoCo-www-$foldername"

        echo -e Archiving existing CoCo-www folder ["CoCo-www"] into backup folder ["CoCo-www-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/rickulland/CoCo-www
git clone https://github.com/rickulland/CoCo-www.git

cd CoCo-www

GITREV=`git rev-parse --short HEAD`

cd ..

echo
echo Done!

