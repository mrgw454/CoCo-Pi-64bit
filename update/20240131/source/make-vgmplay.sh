#!/bin/bash

# install prerequisites
# sudo apt-get install make gcc zlib1g-dev libao-dev libdbus-1-dev

cd $HOME/source

# if a previous vgmplay folder exists, move into a date-time named folder

if [ -d "vgmplay" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "vgmplay" "vgmplay-$foldername"

        echo -e Archiving existing vgmplay folder ["vgmplay"] into backup folder ["vgmplay-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/vgmrips/vgmplay-legacy
git clone https://github.com/vgmrips/vgmplay-legacy.git vgmplay

cd vgmplay/VGMPlay

GITREV=`git rev-parse --short HEAD`

make

exit 1

if [ -f vgm-player ]; then
	sudo make install
	sudo make play_install
else
	echo vgm-player binary not found!
	echo
fi

cd ../..

echo
echo Done!



