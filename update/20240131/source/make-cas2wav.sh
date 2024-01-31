#!/bin/bash

cd $HOME/source

# if a previous cas2wav folder exists, move into a date-time named folder

if [ -d "cas2wav" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "cas2wav" "cas2wav-$foldername"

        echo -e Archiving existing cas2wav folder ["cas2wav"] into backup folder ["cas2wav-$foldername"]
        echo -e
        echo -e
fi

if [ -f cas2wav-0.8.tar.gz ]; then
	rm cas2wav-0.8.tar.gz
fi

# https://www.6809.org.uk/dragon/cas2wav-0.8.tar.gz
wget https://www.6809.org.uk/dragon/cas2wav-0.8.tar.gz

if [ ! -d cas2wav ]; then
	mkdir cas2wav
fi

tar zxvf cas2wav-0.8.tar.gz --strip-components 1 -C $HOME/source/cas2wav

cd cas2wav

make

sudo cp cas2wav /usr/local/bin

cd ..

echo
echo Done!
