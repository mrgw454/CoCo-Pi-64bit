#!/bin/bash

cd $HOME/source

# if a previous cocolife folder exists, move into a date-time named folder

if [ -d "cocolife" ]; then
	foldername=$(date +%Y-%m-%d_%H.%M.%S)
       	mv "cocolife" "cocolife-$foldername"

       	echo -e Archiving existing cocolife folder ["cocolife"] into backup folder ["cocolife-$foldername"]
       	echo -e
       	echo -e
fi

# https://github.com/stixpjr/cocolife
git clone https://github.com/stixpjr/cocolife.git

cd cocolife

GITREV=`git rev-parse --short HEAD`

make
if [ $? -eq 0 ]
then
        echo "build process was successful"
        echo
else
        echo "build process was NOT successful.  Aborting."
        echo
fi

if [ ! -d /media/share1/SDC/STIXPJR ]; then
	mkdir -p /media/share1/SDC/STIXPJR
fi

find . -iname "*.dsk" -exec cp {} /media/share1/SDC/STIXPJR \;

cd ..


echo
echo Done!
