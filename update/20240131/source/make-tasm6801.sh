#!/bin/bash

cd $HOME/source

# if a previous tasm6801 folder exists, move into a date-time named folder

if [ -d "tasm6801" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "tasm6801" "tasm6801-$foldername"

        echo -e Archiving existing tasm6801 folder ["tasm6801"] into backup folder ["tasm6801-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/gregdionne/tasm6801
git clone https://github.com/gregdionne/tasm6801.git

cd tasm6801/src

GITREV=`git rev-parse --short HEAD`

make

cd ..

if [ -f tasm6801 ]; then
	sudo cp tasm6801 /usr/local/bin
else
	echo tasm6801 binary not found!
	echo
fi
cd ..

echo
echo Done!

