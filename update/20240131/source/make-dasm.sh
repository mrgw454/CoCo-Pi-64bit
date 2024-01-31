#!/bin/bash

cd $HOME/source

# if a previous dasm folder exists, move into a date-time named folder

if [ -d "dasm" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "dasm" "dasm-$foldername"

        echo -e Archiving existing dasm folder ["dasm"] into backup folder ["dasm-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/dasm-assembler/dasm
git clone https://github.com/dasm-assembler/dasm.git

cd dasm
make

if [ -f bin/dasm ]; then
	sudo cp bin/* /usr/local/bin
else
	echo binaries not found!
	echo
fi

echo
echo Done!
echo

