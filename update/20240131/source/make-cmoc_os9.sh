#!/bin/bash

cd $HOME/source

# if a previous cmoc_os9 folder exists, move into a date-time named folder

if [ -d "cmoc_os9" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "cmoc_os9" "cmoc_os9-$foldername"

        echo -e Archiving existing cmoc_os9 folder ["cmoc_os9"] into backup folder ["cmoc_os9-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/tlindner/cmoc_os9
git clone https://github.com/tlindner/cmoc_os9.git

cd cmoc_os9

GITREV=`git rev-parse --short HEAD`

cd lib; make
cd ../cgfx; make

cd ../unittest
make clean dsk

exit 1

if [ -f test.dsk ]; then
	echo test.dsk created successfully
else
	echo test.dsk NOT created!
	echo
fi

cd ../..

echo
echo Done!

