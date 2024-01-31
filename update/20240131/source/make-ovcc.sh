#!/bin/bash

if [ ! -f /usr/local/include/agar/agar/core.h ]; then
	echo
	echo AGAR library not found!  Please install that package first.
	echo
	echo Installation aborted.
	echo
	echo
	exit 1
fi

cd $HOME/source

# if a previous OVCC folder exists, move into a date-time named folder

if [ -d "OVCC" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "OVCC" "OVCC-$foldername"

        echo -e Archiving existing OVCC folder ["OVCC"] into backup folder ["OVCC-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/WallyZambotti/OVCC
git clone https://github.com/WallyZambotti/OVCC.git

cd OVCC

GITREV=`git rev-parse --short HEAD`

make

if [ -f CoCo/ovcc ]; then
	echo ovcc binary found.
	echo Copying files to $HOME/.ovcc
	echo

	if [ ! -d $HOME/.ovcc ]; then
		mkdir $HOME/.ovcc
	fi

	if [ ! -d $HOME/.ovcc/OVCC_Libs ]; then
		mkdir $HOME/.ovcc/OVCC_Libs
	fi

	cp CoCo/ovcc $HOME/.ovcc
	cp CoCo/ovcc.ico $HOME/.ovcc
	cp README* $HOME/.ovcc

	find . -name *.so -type f -exec cp {} $HOME/.ovcc/OVCC_Libs \;
else
	echo xroar binary not found!
	echo
fi

cd ..

echo
echo Done!
