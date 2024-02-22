#!/bin/bash

cd $HOME/source

# if a previous cocoio-dw folder exists, move into a date-time named folder

if [ -d "cocoio-dw" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "cocoio-dw" "cocoio-dw-$foldername"

        echo -e Archiving existing cocoio-dw folder ["cocoio-dw"] into backup folder ["cocoio-dw-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/n6il/cocoio-dw
git clone https://github.com/n6il/cocoio-dw.git

cd cocoio-dw

GITREV=`git rev-parse --short HEAD`

make
if [ $? -eq 0 ]
then
        echo "Compilation was successful"
        echo
else
        echo "Compilation was NOT successful"
        echo
        exit 1
fi

cd ..


echo
echo Done!

