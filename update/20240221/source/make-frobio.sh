#!/bin/bash

cd $HOME/source

# if a previous frobio folder exists, move into a date-time named folder

if [ -d "frobio" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "frobio" "frobio-$foldername"

        echo -e Archiving existing frobio folder ["frobio"] into backup folder ["frobio-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/strickyak/frobio
git clone https://github.com/strickyak/frobio.git

cd frobio

GITREV=`git rev-parse --short HEAD`

cd ..

echo
echo Done!

