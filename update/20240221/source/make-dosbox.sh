#!/bin/bash

cd $HOME/source

# if a previous dosbox-code-0 folder exists, move into a date-time named folder

if [ -d "dosbox-code-0" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "dosbox-code-0" "dosbox-code-0-$foldername"

        echo -e Archiving existing dosbox-code-0 folder ["dosbox-code-0"] into backup folder ["dosbox-code-0-$foldername"]
        echo -e
        echo -e
fi

# https://sourceforge.net/p/dosbox/code-0/HEAD/tree/
svn checkout https://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk dosbox-code-0

cd dosbox-code-0
pwd

./autogen.sh
./configure
make


if [ -f src/dosbox ]; then
	sudo make install
else
	echo dosbox binary not found!
	echo
fi

cd ..

echo
echo Done!
