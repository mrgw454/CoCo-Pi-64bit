#!/bin/bash

cd $HOME/source

# https://geany.org/download/releases/

if [ -f geany-2.0.tar.gz ]; then
	rm geany-2.0.tar.gz
fi

if [ -f geany-plugins-2.0.tar.gz ]; then
	rm geany-plugins-2.0.tar.gz
fi

wget https://download.geany.org/geany-2.0.tar.gz
wget https://plugins.geany.org/geany-plugins/geany-plugins-2.0.tar.gz


# if a previous geany folder exists, move into a date-time named folder
if [ -d "geany-2.0" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "geany-2.0" "geany-2.0-$foldername"

        echo -e Archiving existing geany folder ["geany-2.0"] into backup folder ["geany-2.0-$foldername"]
        echo -e
        echo -e
fi

# if a previous geany folder exists, move into a date-time named folder
if [ -d "geany-plugins-2.0" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "geany-plugins-2.0" "geany-plugins-2.0-$foldername"

        echo -e Archiving existing geany folder ["geany-plugins-2.0"] into backup folder ["geany-plugins-2.0-$foldername"]
        echo -e
        echo -e
fi


tar zxvf geany-2.0.tar.gz
tar zxvf geany-plugins-2.0.tar.gz


# build geany-2.0
cd geany-2.0
./configure
make

if [ -f src/geany ]; then
	sudo make install
	echo
else
	echo geany binary not found!  Installation aborted.
	echo
	exit 1
fi


cd ..

# build geany-plugins-2.0
cd geany-plugins-2.0
./configure
make

sudo make install


cd ..

# copy geany config files
if [ -f $HOME/CoCo-Pi-Installer/misc-files.tar.gz ]; then
	tar zxvf $HOME/CoCo-Pi-Installer/misc-files.tar.gz home/pi/.config/geany -C /
fi

echo
echo Done!

