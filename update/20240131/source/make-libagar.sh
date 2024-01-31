#!/bin/bash

cd $HOME/source

# if a previous libagar folder exists, move into a date-time named folder

if [ -d "libagar" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "libagar" "libagar-$foldername"

        echo -e Archiving existing libagar folder ["libagar"] into backup folder ["libagar-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/JulNadeauCA/libagar
git clone https://github.com/JulNadeauCA/libagar.git

cd libagar

GITREV=`git rev-parse --short HEAD`

./configure

make depend all


if [ -f vg/libag_vg.so.8.0.0 ]; then
	sudo make install
else
	echo library libag_vg.so.8.0.0  not found!  Perhaps compilation was not successful?
	echo libagar not installed.
	echo
fi

cd ..

echo
echo Done!


