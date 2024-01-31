#!/bin/bash

cd $HOME/source

# if a previous decb-tools folder exists, move into a date-time named folder

if [ -d "decb-tools" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "decb-tools" "decb-tools-$foldername"

        echo -e Archiving existing decb-tools folder ["decb-tools"] into backup folder ["decb-tools-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/beretta42/fip/tree/master/decb
git clone --depth 1 --no-checkout https://github.com/beretta42/fip.git decb-tools

cd decb-tools

git sparse-checkout set decb
git checkout

cd decb

gcc -o detoken detoken.c

if [ -f detoken ]; then
	echo detoken binary exists
	sudo cp detoken /usr/local/bin
	echo
else
	echo detoken binary does not exist!
	echo
fi

cd ../..

echo
echo Done!

