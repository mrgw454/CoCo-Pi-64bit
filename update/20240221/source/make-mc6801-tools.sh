#!/bin/bash

cd $HOME/source

# if a previous mc6801-tools folder exists, move into a date-time named folder

if [ -d "mc6801-tools" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "mc6801-tools" "mc6801-tools-$foldername"

        echo -e Archiving existing mc6801-tools folder ["mc6801-tools"] into backup folder ["mc6801-tools-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/retrotinker/mc6801-tools
git clone https://github.com/retrotinker/mc6801-tools.git

cd mc6801-tools

GITREV=`git rev-parse --short HEAD`

sed -i 's|PREFIX=/usr/local/m6801-tools|PREFIX=$(HOME)/source/mc6801-tools/bins|' Makefile

echo $(nproc) / 2 | bc
cores=$(echo $(nproc) / 2 | bc)
make -j$cores

if [ $? -eq 0 ]
then
       	echo "Compilation was successful.  Installing."
       	echo
	mkdir bins
	make install
else
       	echo "Compilation was NOT successful.  Aborting installation." >&2
       	echo
       	exit 1
fi

cd bins
for i in *; do [ -x "$i" ] && sudo ln -s "$HOME/source/mc6801-tools/bins/$i" /usr/local/bin/$i; done


cd ../..

echo
echo Done!

