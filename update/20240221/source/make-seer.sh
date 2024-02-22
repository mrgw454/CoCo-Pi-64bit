#!/bin/bash

# install prerequisites
sudo apt install qt6-charts-dev

cd $HOME/source

# if a previous seer folder exists, move into a date-time named folder

if [ -d "seer" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "seer" "seer-$foldername"

        echo -e Archiving existing seer folder ["seer"] into backup folder ["seer-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/epasveer/seer
git clone https://github.com/epasveer/seer.git

cd seer

GITREV=`git rev-parse --short HEAD`

cd src/build
cmake -DCMAKE_BUILD_TYPE=Release ..   # Optimized release -O
make clean

echo $(nproc) / 2 | bc
cores=$(echo $(nproc) / 2 | bc)
make -j$cores seergdb

if [ $? -eq 0 ]
then
        echo "Compilation was successful.  Installing..."
        echo
	sudo make install
else
        echo "Compilation was NOT successful.  Aborting installation." >&2
        echo
        exit 1
fi

cd ../../..

echo
echo Done!

