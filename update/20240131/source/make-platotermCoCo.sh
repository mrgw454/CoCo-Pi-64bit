#!/bin/bash

cd $HOME/source

# if a previous platotermCoCo folder exists, move into a date-time named folder

if [ -d "platotermCoCo" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "platotermCoCo" "platotermCoCo-$foldername"

        echo -e Archiving existing platotermCoCo folder ["platotermCoCo"] into backup folder ["platotermCoCo-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/beretta42/platotermCoCo/tree/master/src/coco2
git clone https://github.com/beretta42/platotermCoCo.git

cd platotermCoCo

GITREV=`git rev-parse --short HEAD`

cd src/coco2
make


if [ -f plato.dsk ]; then
	if [ ! -d /media/share1/SDC/GORDON ]; then
		mkdir -p /media/share1/SDC/GORDON
	fi

	if [ ! -d /media/share1/DW4/GORDON ]; then
		mkdir -p /media/share1/DW4/GORDON
	fi

	echo
	echo plato.dsk image found.
	cp plato.dsk /media/share1/SDC/GORDON
	cp plato.dsk /media/share1/DW4/GORDON
	echo
else
	echo
	echo plato.dsk image not found!  Installation aborted.
	echo
	echo
fi

cd $HOME/source

echo
echo Done!

