#!/bin/bash

cd $HOME/source

# if a previous dzip folder exists, move into a date-time named folder

if [ -d "dzip" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "dzip" "dzip-$foldername"

        echo -e Archiving existing dzip folder ["dzip"] into backup folder ["dzip-$foldername"]
        echo -e
        echo -e
fi

if [ -f dzip.tar.gz ]; then
	rm dzip.tar.gz
fi

# https://www.6809.org.uk/dragon/dzip.tar.gz
wget https://www.6809.org.uk/dragon/dzip.tar.gz

tar zxvf dzip.tar.gz

cd dzip

make

if [ -f dzip ]; then
	sudo cp dzip /usr/local/bin
	sudo cp dunzip /usr/local/bin
else
	echo
	echo dzip binary not found!
fi

cd ..

echo
echo Done!
