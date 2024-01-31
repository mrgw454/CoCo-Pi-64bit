#!/bin/bash

cd $HOME/source

# if a previous conv-tools folder exists, move into a date-time named folder

if [ -d "conv-tools" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "conv-tools" "conv-tools-$foldername"

        echo -e Archiving existing conv-tools folder ["conv-tools"] into backup folder ["conv-tools-$foldername"]
        echo -e
        echo -e
fi

# https://gitlab.com/m6809-computer-tools/conv-tools
git clone https://gitlab.com/m6809-computer-tools/conv-tools.git

cd conv-tools

GITREV=`git rev-parse --short HEAD`

make

sudo find . -executable -type f -maxdepth 1 -exec cp {} /usr/local/bin \;

cd ..

echo
echo Done!
