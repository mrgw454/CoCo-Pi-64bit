#!/bin/bash

cd $HOME/source

# if a previous CoCoC folder exists, move into a date-time named folder

if [ -d "CoCoC" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "CoCoC" "CoCoC-$foldername"

        echo -e Archiving existing CoCoC folder ["CoCoC"] into backup folder ["CoCoC-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/Deek/CoCoC
git clone https://github.com/Deek/CoCoC.git

cd CoCoC

GITREV=`git rev-parse --short HEAD`

cd ..

echo
echo Done!

