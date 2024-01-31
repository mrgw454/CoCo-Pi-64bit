#!/bin/bash

cd $HOME/source

# if a previous RunCPM folder exists, move into a date-time named folder

if [ -d "RunCPM" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "RunCPM" "RunCPM-$foldername"

        echo -e Archiving existing RunCPM folder ["RunCPM"] into backup folder ["RunCPM-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/MockbaTheBorg/RunCPM
git clone https://github.com/MockbaTheBorg/RunCPM.git

cd RunCPM/RunCPM

GITREV=`git rev-parse --short HEAD`

make posix build

if [ -f RunCPM ]; then
	sudo cp RunCPM /usr/local/bin
else
	echo RunCPM binary not found!
	echo
fi
cd ../..

echo
echo Done!

