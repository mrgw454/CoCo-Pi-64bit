#!/bin/bash

cd $HOME/source

# if a previous tnfsd folder exists, move into a date-time named folder

if [ -d "tnfsd" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "tnfsd" "tnfsd-$foldername"

        echo -e Archiving existing tnfsd folder ["tnfsd"] into backup folder ["tnfsd-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/FujiNetWIFI/spectranet/tree/master/tnfs/tnfsd
git clone --depth 1 --no-checkout https://github.com/FujiNetWIFI/spectranet.git tnfsd

cd tnfsd

GITREV=`git rev-parse --short HEAD`

git sparse-checkout set tnfs/tnfsd
git checkout

cd tnfs/tnfsd

make OS=LINUX

if [ -f bin/tnfsd ]; then
	echo
	echo tnfsd binary found.
	sudo cp bin/tnfsd /usr/local/bin
	echo
else
	echo
	echo tnfsd binary not found!  Installation aborted.
	echo
	echo
fi

cd $HOME/source

echo
echo Done!

