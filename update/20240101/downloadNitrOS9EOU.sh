#!/bin/bash

clear

echo
echo
echo
echo
echo
echo
echo
echo
echo
echo

echo -e
echo -e "This script will download the latest NitrOS9 EOU build."
echo -e
echo -e "The existing file(s) will be overwritten."
echo -e
echo -e "Press [CTRL-C] to cancel script or ..."
echo -e
read -p "... Press any key to continue." -n1 -s
echo -e
echo -e
echo -e "Downloading latest file..."
echo -e
wget -c -P /media/share1/EMU/EOU "http://lcurtisboyle.com/nitros9/NitrOS9-EOU-6309-LATEST.zip"
wget -c -P /media/share1/EMU/EOU "http://lcurtisboyle.com/nitros9/NitrOS9-EOU-6809-LATEST.zip"
wget -c -P /media/share1/EMU/EOU "http://www.lcurtisboyle.com/nitros9/EOU_USER_empty_harddrive.zip"

cd /media/share1/EMU/EOU

    echo -e
    unzip -o "/media/share1/EMU/EOU/NitrOS9-EOU-6809-LATEST.zip"
    unzip -o "/media/share1/EMU/EOU/NitrOS9-EOU-6309-LATEST.zip"
    unzip -o "/media/share1/EMU/EOU/EOU_USER_empty_harddrive.zip"

    chmod a-x *.VHD

    rm "/media/share1/EMU/EOU/NitrOS9-EOU-6309-LATEST.zip"
    rm "/media/share1/EMU/EOU/NitrOS9-EOU-6809-LATEST.zip"
    rm "/media/share1/EMU/EOU/EOU_USER_empty_harddrive.zip"

    echo -e
    echo -e "Done!"
    echo -e
    read -p "Press any key to continue." -n1 -s

cd $HOME/.mame


