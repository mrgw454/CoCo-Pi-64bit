#!/bin/bash

cd $HOME/source

# if a previous coremark folder exists, move into a date-time named folder

if [ -d "coremark" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "coremark" "coremark-$foldername"

        echo -e Archiving existing coremark folder ["coremark"] into backup folder ["coremark-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/boisy/coremark
git clone https://github.com/boisy/coremark.git

cd coremark

GITREV=`git rev-parse --short HEAD`

make dsk


if [ -f coremark.dsk ]; then
	if [ ! -d /media/share1/SDC/BOISY ]; then
                mkdir /media/share1/SDC/BOISY
	fi

	echo "cp coremark.dsk /media/share1/SDC/BOISY"
	echo
	echo
	cp coremark.dsk /media/share1/SDC/BOISY
else
	echo coremark.dsk image not found!
	echo
	echo
fi

cd ..

echo
echo Done!
