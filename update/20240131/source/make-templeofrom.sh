#!/bin/bash

cd $HOME/source

# if a previous templeofrom folder exists, move into a date-time named folder

if [ -d "templeofrom" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "templeofrom" "templeofrom-$foldername"

        echo -e Archiving existing templeofrom folder ["templeofrom"] into backup folder ["templeofrom-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/yggdrasilradio/templeofrom
git clone https://github.com/yggdrasilradio/templeofrom.git

cd templeofrom

git checkout develop
git branch -a

GITREV=`git rev-parse --short HEAD`

make

makeDSK-pyDW.sh

if [ -f templeofrom.DSK ]; then
	if [ ! -d /media/share1/SDC/ADAMS ]; then
		mkdir /media/share1/SDC/ADAMS
	fi
	echo "cp templeofrom.DSK /media/share1/SDC/ADAMS/TEMPLE.DSK"
	echo
	cp templeofrom.DSK /media/share1/SDC/ADAMS/TEMPLE.DSK
else
	echo templeofrom.DSK image not found!
	echo
fi


cd ..

echo
echo Done!

