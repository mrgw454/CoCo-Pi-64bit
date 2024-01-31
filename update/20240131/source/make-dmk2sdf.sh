#!/bin/bash

cd $HOME/source

# if a previous dmk2sdf folder exists, move into a date-time named folder

if [ -d "dmk2sdf" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "dmk2sdf" "dmk2sdf-$foldername"

        echo -e Archiving existing dmk2sdf folder ["dmk2sdf"] into backup folder ["dmk2sdf-$foldername"]
        echo -e
        echo -e
fi



if [ ! -d dmk2sdf ]; then
	mkdir dmk2sdf
fi

cd dmk2sdf

# https://cocosdc.blogspot.com/p/sd-card-socket-sd-card-socket-is-push.html
wget https://goo.gl/q61D6s -O dmk2sdf_0.1a1.zip

if [ -f dmk2sdf_0.1a1.zip ]; then
	echo dmk2sdf_0.1a1.zip archive files exists.  Extracting.
	echo
	unzip -j dmk2sdf_0.1a1.zip dmk2sdf_0.1a1/src/*
else
	echo dmk2sdf_0.1a1.zip archive files does NOT exist.  Aborting.
	echo
	exit 1
fi

gcc -o dmk2sdf dmk2sdf.c
if [ $? -eq 0 ]
then
        echo "Compilation was successful.  Installing..."
        echo
	sudo ln -s $HOME/source/dmk2sdf/dmk2sdf /usr/local/bin/dmk2sdf
	echo sudo ln -s $HOME/source/dmk2sdf/dmk2sdf /usr/local/bin/dmk2sdf
else
        echo "Compilation was NOT successful.  Aborting installation." >&2
        echo
        exit 1
fi

cd ..


echo
echo Done!
