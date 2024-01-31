#!/bin/bash

cd $HOME/source

# if a previous A09 folder exists, move into a date-time named folder

if [ -d "A09" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "A09" "A09-$foldername"

        echo -e Archiving existing A09 folder ["A09"] into backup folder ["A09-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/Arakula/A09
git clone https://github.com/Arakula/A09.git

cd A09

GITREV=`git rev-parse --short HEAD`

make

if [ -f a09 ]; then
	sudo cp a09 /usr/local/bin
else
	echo a09 binary not found!
	echo
fi
cd ..

echo
echo Done!

