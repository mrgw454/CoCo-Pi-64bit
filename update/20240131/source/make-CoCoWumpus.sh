#!/bin/bash

cd $HOME/source

# if a previous CoCoWumpus folder exists, move into a date-time named folder

if [ -d "CoCoWumpus" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "CoCoWumpus" "CoCoWumpus-$foldername"

        echo -e Archiving existing CoCoWumpus folder ["CoCoWumpus"] into backup folder ["CoCoWumpus-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/evancwright/CoCoWumpus
git clone https://github.com/evancwright/CoCoWumpus.git

cd CoCoWumpus

GITREV=`git rev-parse --short HEAD`

chmod a+x build.sh
chmod a+x buildccc.sh

#./build.sh
#./buildccc.sh


if [ -f WUMPUS.DSK ]; then
	if [ ! -d /media/share1/SDC/WRIGHT ]; then
                mkdir /media/share1/SDC/WRIGHT
	fi

	echo "cp WUMPUS.DSK /media/share1/SDC/WRIGHT"
	echo
	echo
	cp WUMPUS.DSK /media/share1/SDC/WRIGHT
else
	echo WUMPUS.DSK image not found!
	echo
	echo
fi


if [ -f wumpus.ccc ]; then
	if [ ! -d /media/share1/carts/WRIGHT ]; then
                mkdir /media/share1/carts/WRIGHT
	fi

	echo "cp wumpus.ccc /media/share1/carts/WRIGHT"
	echo
	echo
	cp wumpus.ccc /media/share1/carts/WRIGHT
else
	echo wumpus.ccc cart image not found!
	echo
	echo
fi

cd ..

echo
echo Done!
