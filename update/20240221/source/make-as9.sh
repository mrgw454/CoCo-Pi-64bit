#!/bin/bash

cd $HOME/source

# if a previous as9 folder exists, move into a date-time named folder

if [ -d "as9" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "as9" "as9-$foldername"

        echo -e Archiving existing as9 folder ["as9"] into backup folder ["as9-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/jty/as9
git clone https://github.com/jty/as9.git

cd as9

GITREV=`git rev-parse --short HEAD`

make

if [ $? -eq 0 ]
then
        echo "compilation was successful.  Installing."
        echo
	find $HOME/source/as9 -maxdepth 1 -executable -type f -exec echo cp {} /usr/local/bin/ \;
else
        echo "compilation was NOT successful.  Aborting installation."
        echo
        exit 1
fi

cd ..


echo
echo Done!
