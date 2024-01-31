#!/bin/bash

cd $HOME/source

# if a previous motorola-6800-assembler folder exists, move into a date-time named folder

if [ -d "motorola-6800-assembler" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "motorola-6800-assembler" "motorola-6800-assembler-$foldername"

        echo -e Archiving existing motorola-6800-assembler folder ["motorola-6800-assembler"] into backup folder ["motorola-6800-assembler-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/JimInCA/motorola-6800-assembler
git clone https://github.com/JimInCA/motorola-6800-assembler.git

cd motorola-6800-assembler

GITREV=`git rev-parse --short HEAD`

make

if [ -f bin/as0 ]; then
	sudo cp bin/* /usr/local/bin
else
	echo binaries not found!
	echo
fi
cd ..

echo
echo Done!

