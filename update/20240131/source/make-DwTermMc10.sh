#!/bin/bash

cd $HOME/source

# if a previous DwTermMc10 folder exists, move into a date-time named folder

if [ -d "DwTermMc10" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "DwTermMc10" "DwTermMc10-$foldername"

        echo -e Archiving existing DwTermMc10 folder ["DwTermMc10"] into backup folder ["DwTermMc10-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/n6il/DwTermMc10
git clone https://github.com/n6il/DwTermMc10.git

cd DwTermMc10

GITREV=`git rev-parse --short HEAD`


chmod a+x make.sh

sed -i 's|"${AS}"|as1|' make.sh
./make.sh

if [ -f dwterm.c10 ]; then
        if [ ! -d /media/share1/MCX/FURMAN/DWTERMCC10 ]; then
                mkdir -p /media/share1/MCX/FURMAN/DWTERMCC10
                echo "cp dwterm.c10 /media/share1/MCX/FURMAN/DWTERMCC10"
                echo "cp dwterm.bin /media/share1/MCX/FURMAN/DWTERMCC10"
                echo "cp dwterm.wav /media/share1/MCX/FURMAN/DWTERMCC10"
                echo
                cp dwterm.c10 /media/share1/MCX/FURMAN/DWTERMCC10
                cp dwterm.bin /media/share1/MCX/FURMAN/DWTERMCC10
                cp dwterm.wav /media/share1/MCX/FURMAN/DWTERMCC10
        fi
else
        echo dwterm.c10 image not found!
        echo
fi


echo
echo Done!

