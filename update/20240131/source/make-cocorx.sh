#!/bin/bash

cd $HOME/source

# if a previous cocorx folder exists, move into a date-time named folder

if [ -d "cocorx" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "cocorx" "cocorx-$foldername"

        echo -e Archiving existing cocorx folder ["cocorx"] into backup folder ["cocorx-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/boisy/cocorx
git clone https://github.com/boisy/cocorx.git

cd cocorx

GITREV=`git rev-parse --short HEAD`

make

if [ -f cocorx.rom ]; then
	if [ ! -d /media/share1/carts/BOISY ]; then
                mkdir /media/share1/carts/BOISY
	fi

	echo "cp cocorx.rom /media/share1/carts/BOISY"
	echo
	echo
	cp cocorx.rom /media/share1/carts/BOISY
else
	echo cocorx.rom not found!
	echo
	echo
fi

cd ..

echo
echo Done!
