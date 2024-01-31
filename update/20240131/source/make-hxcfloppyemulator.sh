#!/bin/bash

cd $HOME/source

# if a previous HxCFloppyEmulator folder exists, move into a date-time named folder

if [ -d "HxCFloppyEmulator" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "HxCFloppyEmulator" "HxCFloppyEmulator-$foldername"

        echo -e Archiving existing HxCFloppyEmulator folder ["HxCFloppyEmulator"] into backup folder ["HxCFloppyEmulator-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/jfdelnero/HxCFloppyEmulator
git clone https://github.com/jfdelnero/HxCFloppyEmulator.git

cd HxCFloppyEmulator/build

make

if [ -f hxcfloppyemulator ]; then
	echo hxcfloppyemulator binary found
	echo
else
	echo hxcfloppyemulator binary NOT found!
	echo
fi

echo
echo Done!

