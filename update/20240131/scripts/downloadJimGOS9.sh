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
echo -e "This script will download Jim Gerrie's NitrOS9 EOU Testing repository."
echo -e
echo -e "The existing file(s) will be overwritten."
echo -e
echo -e "Press [CTRL-C] to cancel script or ..."
echo -e
read -p "... Press any key to continue." -n1 -s
echo -e
echo -e
echo -e "Downloading repo..."
echo -e

cd $HOME/source

# remove symbolic link if exists
if [ -L /media/share1/JimGerrieOS9 ]; then
	rm /media/share1/JimGerrieOS9
fi


# remove repo if exists
if [ -d $HOME/source/JimGerrieOS9 ]; then
	rm -rf $HOME/source/JimGerrieOS9
fi


# https://github.com/jggames/JimGerrieOS9
git clone https://github.com/jggames/JimGerrieOS9.git


# create new symbolic link
ln -s $HOME/source/JimGerrieOS9/EOU_Testing /media/share1/JimGerrieOS9

echo -e
echo -e "Done!"
echo -e
read -p "Press any key to continue." -n1 -s

cd $HOME/.mame


