#!/bin/bash

cd $HOME/source

# if a previous lwtools folder exists, move into a date-time named folder

if [ -d "lwtools" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "lwtools" "lwtools-$foldername"

        echo -e Archiving existing lwtools folder ["lwtools"] into backup folder ["lwtools-$foldername"]
        echo -e
        echo -e
fi

# http://www.lwtools.ca/
hg clone http://lwtools.projects.l-w.ca/hg/ lwtools

cd $HOME/source/lwtools

make
sudo make install

echo
echo Done!
echo

