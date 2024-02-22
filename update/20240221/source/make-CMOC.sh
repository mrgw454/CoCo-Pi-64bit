#!/bin/bash

cd $HOME/source

# if a previous CMOC folder exists, move into a date-time named folder

if [ -d "CMOC" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "CMOC" "CMOC-$foldername"

        echo -e Archiving existing CMOC folder ["CMOC"] into backup folder ["CMOC-$foldername"]
        echo -e
        echo -e
fi

if [ ! -f cmoc-0.1.85.tar.gz ]; then
	# https://perso.b2b2c.ca/~sarrazip/dev/cmoc.html
	wget --no-check-certificate https://perso.b2b2c.ca/~sarrazip/dev/cmoc-0.1.85.tar.gz
fi

if [ ! -d CMOC ]; then
	mkdir CMOC
fi

tar zxvf cmoc-0.1.85.tar.gz --strip-components 1 -C $HOME/source/CMOC

cd CMOC

./configure
make

sudo make install

cd ..

echo
echo Done!
