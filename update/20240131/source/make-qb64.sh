#!/bin/bash

cd $HOME/source

# if a previous qb64 folder exists, move into a date-time named folder

if [ -d "qb64" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "qb64" "qb64-$foldername"

        echo -e Archiving existing qb64 folder ["qb64"] into backup folder ["qb64-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/QB64Team/qb64
#git clone https://github.com/QB64Team/qb64.git

# https://github.com/QB64Official/qb64
git clone https://github.com/QB64Official/qb64.git

cd $HOME/source/qb64

./setup_lnx.sh

