#!/bin/bash

# script to create package (*.deb) file for CoCo-Pi project

# get name of script and place it into a variable
scriptname=`basename "$0"`

# get name of current folder and place it into a variable
workfolder=`basename "$PWD"`
workdir=$(pwd)

# parse command line parameters for standard help options
if [[ $1 =~ --h|--help|-h ]];then

	echo
	echo "Example syntax:"
	echo
	echo "./$scriptname <mame folder>"
	echo

	exit 1

fi

# if no arguments are passed
if [ -z "$1" ]
then
	echo "No arguments provided"
	echo
	echo "Example syntax:"
	echo
	echo "./$scriptname <mame folder>"
	echo
	echo

	exit 1
else
	echo "MAME folder: '$1'"
	echo
	echo
fi

mamefolder=$1
mamever=${mamefolder:(-3)}
mamepackage=mameCoCoPi-0.$mamever-1.deb
mamepackagefolder=mameCoCoPi-0.$mamever-1

systemtype=$(dpkg --print-architecture)
echo architecture = $systemtype

# verify MAME folder exists
if [ ! -d $mamefolder ]; then
	echo the MAME folder you specified does NOT exist.  Aborting.
	echo
	echo
	exit 1
fi


# remove previous package if it exists
if [ -f $mamepackagefolder.deb ]; then
	echo previous package file found.  Removing.
	rm $mamepackagefolder.deb
	echo
	echo
fi


if [ -d $mamepackagefolder ]; then
	echo previous $mamepackagefolder exists.  Removing.
	rm -rf $mamepackagefolder
	echo
	echo
fi

echo Creating $mamepackagefolder ...
mkdir $mamepackagefolder
mkdir $mamepackagefolder/DEBIAN
mkdir $mamepackagefolder/opt
mkdir $mamepackagefolder/opt/mame-0.$mamever
echo
echo


# create DEBIAN control file for package
echo creating DEBIAN package control file...
echo
echo Package: $mamepackage > $mamepackagefolder/DEBIAN/control
echo Version: 0.$mamever-1 >> $mamepackagefolder/DEBIAN/control
echo Section: base >> $mamepackagefolder/DEBIAN/control
echo Priority: optional >> $mamepackagefolder/DEBIAN/control
echo Architecture: $systemtype >> $mamepackagefolder/DEBIAN/control
echo Depends: >> $mamepackagefolder/DEBIAN/control
echo "Maintainer: Ron Klein <ron@kdomain.org>" >> $mamepackagefolder/DEBIAN/control
echo Description: MAME 0.$mamever for the CoCo-Pi Project >> $mamepackagefolder/DEBIAN/control
echo " Coco-Pi Project:" >> $mamepackagefolder/DEBIAN/control
echo " http://coco-pi.com" >> $mamepackagefolder/DEBIAN/control
echo " MAME Project:" >> $mamepackagefolder/DEBIAN/control
echo " https://www.mamedev.org/" >> $mamepackagefolder/DEBIAN/control
echo
echo

# copy required MAME source folders into package folder
cp -r $mamefolder/artwork $mamepackagefolder/opt/mame-0.$mamever
cp -r $mamefolder/bgfx $mamepackagefolder/opt/mame-0.$mamever
cp -r $mamefolder/ctrlr $mamepackagefolder/opt/mame-0.$mamever
cp -r $mamefolder/docs $mamepackagefolder/opt/mame-0.$mamever
cp -r $mamefolder/hash $mamepackagefolder/opt/mame-0.$mamever
cp -r $mamefolder/hlsl $mamepackagefolder/opt/mame-0.$mamever
cp -r $mamefolder/ini $mamepackagefolder/opt/mame-0.$mamever
cp -r $mamefolder/language $mamepackagefolder/opt/mame-0.$mamever
cp -r $mamefolder/plugins $mamepackagefolder/opt/mame-0.$mamever
cp -r $mamefolder/roms $mamepackagefolder/opt/mame-0.$mamever
cp -r $mamefolder/samples $mamepackagefolder/opt/mame-0.$mamever
cp $mamefolder/* $mamepackagefolder/opt/mame-0.$mamever 2>/dev/null

if [ -f $mamepackagefolder/opt/mame-0.$mamever/useroptions.mak ]; then
	rm $mamepackagefolder/opt/mame-0.$mamever/useroptions.mak
fi

rm $mamepackagefolder/opt/mame-0.$mamever/dist.mak


# build package file
dpkg-deb --build $mamepackagefolder

if [ -f mameCoCoPi-0.$mamever-1.deb ]; then
	echo MAME package $mamepackagefolder.deb built successfully!
	echo
	echo
else
	echo MAME package $mamepackagefolder.deb  build failed.  Aborting.
	echo
	echo
fi


echo
echo
echo Done!
echo

