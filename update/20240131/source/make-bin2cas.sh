#!/bin/bash

cd $HOME/source

# if a previous bin2cas folder exists, move into a date-time named folder

if [ -d "bin2cas" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "bin2cas" "bin2cas-$foldername"

        echo -e Archiving existing bin2cas folder ["bin2cas"] into backup folder ["bin2cas-$foldername"]
        echo -e
        echo -e
fi


if [ ! -d bin2cas ]; then
	mkdir bin2cas
fi

cd bin2cas

# https://www.6809.org.uk/dragon/bin2cas.pl
wget https://www.6809.org.uk/dragon/bin2cas.pl
wget https://www.6809.org.uk/dragon/bin2cas.txt

chmod a+x bin2cas.pl

sudo cp bin2cas.pl /usr/local/bin/bin2cas

cd ..

echo
echo Done!
