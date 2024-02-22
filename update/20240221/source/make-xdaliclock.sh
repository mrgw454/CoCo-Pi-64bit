#!/bin/bash

cd $HOME/source

# if a previous xdaliclock folder exists, move into a date-time named folder

if [ -d "xdaliclock" ]; then
	foldername=$(date +%Y-%m-%d_%H.%M.%S)
       	mv "xdaliclock" "xdaliclock-$foldername"

       	echo -e Archiving existing xdaliclock folder ["xdaliclock"] into backup folder ["xdaliclock-$foldername"]
       	echo -e
       	echo -e
fi

# https://github.com/jamieleecho/xdaliclock
git clone https://github.com/jamieleecho/xdaliclock.git

cd xdaliclock

GITREV=`git rev-parse --short HEAD`

cd coco

make

if [ $? -eq 0 ]
then
        echo "build process was successful"
        echo
else
        echo "build process was NOT successful.  Aborting."
        echo
	exit 1
fi

if [ ! -d /media/share1/SDC/CHO ]; then
	mkdir -p /media/share1/SDC/CHO
fi

find . -iname "*.dsk" -exec cp {} /media/share1/SDC/CHO \;

cd ../..


echo
echo Done!
