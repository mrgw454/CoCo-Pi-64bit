#!/bin/bash

cd $HOME/source

# if a previous coco_roms folder exists, move into a date-time named folder

if [ -d "coco_roms" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "coco_roms" "coco_roms-$foldername"

        echo -e Archiving existing coco_roms folder ["coco_roms"] into backup folder ["coco_roms-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/tomctomc/coco_roms
git clone https://github.com/tomctomc/coco_roms.git

cd coco_roms

GITREV=`git rev-parse --short HEAD`

make

cd ..

echo
echo Done!



