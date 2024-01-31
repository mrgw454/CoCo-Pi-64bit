#!/bin/bash

cd $HOME/source

# if a previous sim6809 folder exists, move into a date-time named folder

if [ -d "sim6809" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "sim6809" "sim6809-$foldername"

        echo -e Archiving existing sim6809 folder ["sim6809"] into backup folder ["sim6809-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/beretta42/sim6809.git
git clone https://github.com/beretta42/sim6809.git

cd sim6809/emu

GITREV=`git rev-parse --short HEAD`

make

if [ -f sim6809 ]; then
	sudo cp sim6809 /usr/local/bin
else
	echo sim6809 binary not found!
	echo
fi

cd ../..

echo
echo Done!

