#!/bin/bash

cd $HOME/source

# if a previous file2dsk folder exists, move into a date-time named folder

if [ -d "file2dsk" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "file2dsk" "file2dsk-$foldername"

        echo -e Archiving existing file2dsk folder ["file2dsk"] into backup folder ["file2dsk-$foldername"]
        echo -e
        echo -e
fi


if [ ! -f file2dsk-1.0.7-src.tar.gz ]; then
	# https://www.chipple.net/coco/file2dsk/
	wget https://www.chipple.net/mt/archives/coco/File2DSK/file2dsk-1.0.7-src.tar.gz
fi

if [ -f file2dsk-1.0.7-src.tar.gz ]; then
	tar zxvf file2dsk-1.0.7-src.tar.gz
else
	echo file2dsk-1.0.7-src.tar.gz archive NOT found.  Aborting.
	echo
	exit 1
fi

cd file2dsk

./autogen.sh
./configure
make
sudo make install

cd ..

echo
echo Done!

