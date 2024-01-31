#!/bin/bash

cd $HOME/source

# if a previous trs-mc10 folder exists, move into a date-time named folder

if [ -d "trs-mc10" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "trs-mc10" "trs-mc10-$foldername"

        echo -e Archiving existing trs-mc10 folder ["trs-mc10"] into backup folder ["trs-mc10-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/linuxha/trs-mc10
git clone https://github.com/linuxha/trs-mc10.git

cd trs-mc10

GITREV=`git rev-parse --short HEAD`

chmod a+x *.py

cd ..

echo
echo Done!

