#!/bin/bash

cd $HOME/source

# if a previous tcpser folder exists, move into a date-time named folder

if [ -d "tcpser" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "tcpser" "tcpser-$foldername"

        echo -e Archiving existing tcpser folder ["tcpser"] into backup folder ["tcpser-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/go4retro/tcpser
git clone https://github.com/go4retro/tcpser.git

cd tcpser

GITREV=`git rev-parse --short HEAD`

make

if [ -f tcpser ]; then
	sudo cp tcpser /usr/local/bin
else
	echo tcpser binary not found!
	echo
fi

cd ..

echo
echo Done!

