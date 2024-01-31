#!/bin/bash

cd $HOME/source

# if a previous dload_server folder exists, move into a date-time named folder

if [ -d "dload_server" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "dload_server" "dload_server-$foldername"

        echo -e Archiving existing dload_server folder ["dload_server"] into backup folder ["dload_server-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/TJBChris/dload_server
git clone https://github.com/TJBChris/dload_server.git

cd dload_server

GITREV=`git rev-parse --short HEAD`

gcc -o dload dload.c

if [ -f dload ]; then
	sudo cp dload /usr/local/bin
else
	echo dload binary not found!
	echo
fi
cd ..

echo
echo Done!

