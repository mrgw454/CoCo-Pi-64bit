#!/bin/bash

cd $HOME/source

# if a previous DwTerm folder exists, move into a date-time named folder

if [ -d "DwTerm" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "DwTerm" "DwTerm-$foldername"

        echo -e Archiving existing DwTerm folder ["DwTerm"] into backup folder ["DwTerm-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/n6il/DwTerm
git clone https://github.com/n6il/DwTerm.git

cd DwTerm

GITREV=`git rev-parse --short HEAD`

make

if [ -f DWTERM.dsk ]; then
        if [ ! -d /media/share1/SDC/FURMAN ]; then
                mkdir -p /media/share1/SDC/FURMAN
        fi

        if [ ! -d /media/share1/SDC/FURMAN/DWTERM ]; then
                mkdir -p /media/share1/SDC/FURMAN/DWTERM
        fi


        if [ ! -d /media/share1/DW4/FURMAN ]; then
                mkdir -p /media/share1/DW4/FURMAN
        fi

        if [ ! -d /media/share1/DW4/FURMAN/DWTERM ]; then
                mkdir -p /media/share1/DW4/FURMAN/DWTERM
        fi

        echo "cp DWTERM.dsk /media/share1/SDC/FURMAN/DWTERM"
        echo "cp DWTERM.dsk /media/share1/DW4/FURMAN/DWTERM"
        echo
        echo
        cp DWTERM.dsk /media/share1/SDC/FURMAN/DWTERM
        cp DWTERM.dsk /media/share1/DW4/FURMAN/DWTERM
else
        echo DWTERM.dsk image not found!
        echo
        echo
fi


if [ -f DWTBCKLT.CAS ]; then
        if [ ! -d /media/share1/cassette/FURMAN ]; then
                mkdir -p /media/share1/cassette/FURMAN
        fi

        if [ ! -d /media/share1/cassette/FURMAN/DWTERM ]; then
                mkdir -p /media/share1/cassette/FURMAN/DWTERM
        fi

        echo "cp DWTBCKLT.CAS /media/share1/cassette/FURMAN/DWTERM"
        echo "cp DWTBB1LT.CAS /media/share1/cassette/FURMAN/DWTERM"
        echo
        echo
        cp DWTBCKLT.CAS /media/share1/cassette/FURMAN/DWTERM
        cp DWTBB1LT.CAS /media/share1/cassette/FURMAN/DWTERM
else
        echo DWTBCKLT.CAS image not found!
        echo
        echo
fi





















echo
echo Done!

