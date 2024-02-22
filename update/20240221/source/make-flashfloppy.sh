#!/bin/bash

# install prerequisites
sudo apt install git gcc-arm-none-eabi python3-pip srecord stm32flash zip unzip wget python3-intelhex python3-crcmod

cd $HOME/source

# if a previous flashfloppy folder exists, move into a date-time named folder

if [ -d "flashfloppy" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "flashfloppy" "flashfloppy-$foldername"

        echo -e Archiving existing flashfloppy folder ["flashfloppy"] into backup folder ["flashfloppy-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/keirf/flashfloppy
git clone https://github.com/keirf/flashfloppy.git

cd flashfloppy

make dist


if find . -name *.upd 1> /dev/null 2>&1; then
	echo flashfloppy firmware created successfully
	echo
	find . -name *.upd
	echo
else
	echo no flashfloppy firmware files found
	echo
fi

echo
echo Done!

