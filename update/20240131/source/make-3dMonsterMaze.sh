#!/bin/bash

cd $HOME/source

# if a previous 3dMonsterMaze folder exists, move into a date-time named folder

if [ -d "3dMonsterMaze" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "3dMonsterMaze" "3dMonsterMaze-$foldername"

        echo -e Archiving existing 3dMonsterMaze folder ["3dMonsterMaze"] into backup folder ["3dMonsterMaze-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/evancwright/3dMonsterMaze
git clone https://github.com/evancwright/3dMonsterMaze.git

cd 3dMonsterMaze

GITREV=`git rev-parse --short HEAD`

chmod a+x build.sh

#./build.sh

lwasm --6809 main.asm --list=main.list --output=3dmnstr.bin
lwasm --6809 mainccc.asm --format=raw --list=mainccc.list --output=3dmnstr.ccc

makeDSK-pyDW.sh


if [ -f 3dMonsterMaze.DSK ]; then
	if [ ! -d /media/share1/SDC/WRIGHT ]; then
                mkdir /media/share1/SDC/WRIGHT
	fi

	echo "cp 3dMonsterMaze.DSK /media/share1/SDC/WRIGHT/3DMNSTR.DSK"
	echo
	echo
	cp 3dMonsterMaze.DSK /media/share1/SDC/WRIGHT/3DMNSTR.DSK
else
	echo 3dMonsterMaze.DSK image not found!
	echo
	echo
fi


if [ -f 3dmnstr.ccc ]; then
	if [ ! -d /media/share1/carts/WRIGHT ]; then
                mkdir /media/share1/carts/WRIGHT
	fi

	echo "cp 3dmnstr.ccc /media/share1/carts/WRIGHT"
	echo
	echo
	cp 3dmnstr.ccc /media/share1/carts/WRIGHT
else
	echo FLOODIT.CCC cart image not found!
	echo
	echo
fi

cd ..

echo
echo Done!
