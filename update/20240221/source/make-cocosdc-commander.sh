#!/bin/bash

cd $HOME/source

# if a previous cocosdc-commander folder exists, move into a date-time named folder

if [ -d "cocosdc-commander" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "cocosdc-commander" "cocosdc-commander-$foldername"

        echo -e Archiving existing cocosdc-commander folder ["cocosdc-commander"] into backup folder ["cocosdc-commander-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/n6il/cocosdc-commander
git clone https://github.com/n6il/cocosdc-commander.git

cd cocosdc-commander

GITREV=`git rev-parse --short HEAD`

# for DECB
make DECB=1
if [ $? -eq 0 ]
then
        echo "Compilation was successful"
        echo
else
        echo "Compilation was NOT successful"
        echo
        exit 1
fi


# for NitrOS9
make sdccmdr-os9.DSK
make update-os9
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

