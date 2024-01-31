#!/bin/bash

cd $HOME/source

# if a previous cocole folder exists, move into a date-time named folder

if [ -d "cocole" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "cocole" "cocole-$foldername"

        echo -e Archiving existing cocole folder ["cocole"] into backup folder ["cocole-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/yggdrasilradio/cocole
git clone https://github.com/yggdrasilradio/cocole.git

cd cocole

GITREV=`git rev-parse --short HEAD`

if [ -f redistribute/cocole.dsk ]; then
	if [ ! -d /media/share1/SDC/ADAMS ]; then
		mkdir /media/share1/SDC/ADAMS
	fi

	echo "cp redistribute/cocole.dsk /media/share1/SDC/ADAMS"
	echo
	cp redistribute/cocole.dsk /media/share1/SDC/ADAMS
else
	echo cocole.dsk image not found!
	echo
fi


cd ..

echo
echo Done!

