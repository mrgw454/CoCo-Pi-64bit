#!/bin/bash

cd $HOME/source

# if a previous CoCoFun folder exists, move into a date-time named folder

if [ -d "CoCoFun" ]; then
	foldername=$(date +%Y-%m-%d_%H.%M.%S)
       	mv "CoCoFun" "CoCoFun-$foldername"

       	echo -e Archiving existing CoCoFun folder ["CoCoFun"] into backup folder ["CoCoFun-$foldername"]
       	echo -e
       	echo -e
fi

# https://github.com/jamieleecho/CoCoFun
git clone https://github.com/jamieleecho/CoCoFun.git

cd CoCoFun

GITREV=`git rev-parse --short HEAD`

./build-github

if [ $? -eq 0 ]
then
        echo "build process was successful"
        echo
else
        echo "build process was NOT successful.  Aborting."
        echo
        exit 1
fi

cd Ancient
makeDSK-pyDW.sh

cd ..

if [ ! -d /media/share1/SDC/CHO ]; then
	mkdir -p /media/share1/SDC/CHO
fi

find . -iname "*.dsk" -exec cp {} /media/share1/SDC/CHO \;

cd ..


echo
echo Done!
