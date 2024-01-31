#!/bin/bash

clear

# set current image filename
export SDCIMAGE=https://github.com/jggames/jggames/releases/download/11/JGGAMES.zip

echo
echo
echo
echo
echo
echo
echo
echo

echo -e
echo -e "This script will download the 'JGGAMES archive from Jim Gerrie's repository."
echo -e
echo -e "Please make a backup of all your files in /media/share1/SDC/JGGAMES"
echo -e "as any existing file(s) will be overwritten."
echo -e
echo -e "Press [CTRL-C] to cancel script or ..."
echo -e
read -p "... Press any key to continue." -n1 -s
echo -e
echo -e
echo -e "Downloading JGGAMES Image file..."
echo -e
wget --no-use-server-timestamps -c -P /media/share1/SDC $SDCIMAGE

cd /media/share1/SDC

    echo -e "Extracting files into /media/share1/SDC/JGGAMES..."
    echo -e
    fn=$(ls -t | head -n1)

    unzip -j -o "$fn" -d /media/share1/SDC/JGGAMES
    echo -e
    echo -e "Done!"
    echo -e
    read -p "Press any key to continue." -n1 -s

rm "$fn"

cd $HOME/.mame


