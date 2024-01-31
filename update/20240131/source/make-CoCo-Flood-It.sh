#!/bin/bash

cd $HOME/source

# if a previous CoCo-Flood-It folder exists, move into a date-time named folder

if [ -d "CoCo-Flood-It" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "CoCo-Flood-It" "CoCo-Flood-It-$foldername"

        echo -e Archiving existing CoCo-Flood-It folder ["CoCo-Flood-It"] into backup folder ["CoCo-Flood-It-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/evancwright/CoCo-Flood-It
git clone https://github.com/evancwright/CoCo-Flood-It.git

cd CoCo-Flood-It

GITREV=`git rev-parse --short HEAD`

chmod a+x buildit
chmod a+x build_cart

#./buildit
#./build_cart


if [ -f EVAN.DSK ]; then
	if [ ! -d /media/share1/SDC/WRIGHT ]; then
                mkdir /media/share1/SDC/WRIGHT
	fi

	echo "cp EVAN.DSK /media/share1/SDC/WRIGHT/FLOODIT.DSK"
	echo
	echo
	cp EVAN.DSK /media/share1/SDC/WRIGHT/FLOODIT.DSK
else
	echo EVAN.DSK image not found!
	echo
	echo
fi


if [ -f FLOODIT.CCC ]; then
	if [ ! -d /media/share1/carts/WRIGHT ]; then
                mkdir /media/share1/carts/WRIGHT
	fi

	echo "cp FLOODIT.CCC /media/share1/carts/WRIGHT"
	echo
	echo
	cp FLOODIT.CCC /media/share1/carts/WRIGHT
else
	echo FLOODIT.CCC cart image not found!
	echo
	echo
fi

cd ..

echo
echo Done!
