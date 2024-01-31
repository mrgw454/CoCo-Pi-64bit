#!/bin/bash

cd $HOME/source

# if a previous cocofs folder exists, move into a date-time named folder

if [ -d "cocofs" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "cocofs" "cocofs-$foldername"

        echo -e Archiving existing cocofs folder ["cocofs"] into backup folder ["cocofs-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/thorpej/cocofs
git clone https://github.com/thorpej/cocofs.git

cd cocofs

GITREV=`git rev-parse --short HEAD`

make

if [ -f cocofs ]; then
	sudo cp cocofs /usr/local/bin
else
	echo cocofs binary not found!
	echo
fi
cd ..

echo
echo Done!

