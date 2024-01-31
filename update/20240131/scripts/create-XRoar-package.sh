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
	echo "./$scriptname <xroar folder>"
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
	echo "./$scriptname <xroar folder>"
	echo
	echo

	exit 1
else
	echo "xroar folder: '$1'"
	echo
	echo
fi

xroarfolder=$1
xroarver=${xroarfolder:(-3)}
xroarpackage=xroarCoCoPi-$xroarver-1.deb
xroarpackagefolder=xroarCoCoPi-$xroarver-1

systemtype=$(dpkg --print-architecture)
echo architecture = $systemtype

# verify xroar folder exists
if [ ! -d $xroarfolder ]; then
	echo the xroar folder you specified does NOT exist.  Aborting.
	echo
	echo
	exit 1
fi


# remove previous package if it exists
if [ -f $xroarpackagefolder.deb ]; then
	echo previous package file found.  Removing.
	rm $xroarpackagefolder.deb
	echo
	echo
fi


if [ -d $xroarpackagefolder ]; then
	echo previous $xroarpackagefolder exists.  Removing.
	rm -rf $xroarpackagefolder
	echo
	echo
fi

echo Creating $xroarpackagefolder ...
mkdir $xroarpackagefolder
mkdir $xroarpackagefolder/DEBIAN
mkdir -p $xroarpackagefolder/usr/local/bin
echo
echo


# create DEBIAN control file for package
echo creating DEBIAN package control file...
echo
echo Package: $xroarpackage > $xroarpackagefolder/DEBIAN/control
echo Version: $xroarver-1 >> $xroarpackagefolder/DEBIAN/control
echo Section: base >> $xroarpackagefolder/DEBIAN/control
echo Priority: optional >> $xroarpackagefolder/DEBIAN/control
echo Architecture: $systemtype >> $xroarpackagefolder/DEBIAN/control
echo Depends: >> $xroarpackagefolder/DEBIAN/control
echo "Maintainer: Ron Klein <ron@kdomain.org>" >> $xroarpackagefolder/DEBIAN/control
echo Description: XRoar-$xroarver for the CoCo-Pi Project >> $xroarpackagefolder/DEBIAN/control
echo " Coco-Pi Project:" >> $xroarpackagefolder/DEBIAN/control
echo " http://coco-pi.com" >> $xroarpackagefolder/DEBIAN/control
echo " xroar Project:" >> $xroarpackagefolder/DEBIAN/control
echo " https://www.6809.org.uk/xroar/" >> $xroarpackagefolder/DEBIAN/control
echo
echo

# copy required xroar components into package folder
cp -r $xroarfolder/src/xroar $xroarpackagefolder/usr/local/bin/xroar-$xroarver


# build package file
dpkg-deb --build $xroarpackagefolder

if [ -f xroarCoCoPi-$xroarver-1.deb ]; then
	echo xroar package $xroarpackagefolder.deb built successfully!
	echo
	echo
else
	echo xroar package $xroarpackagefolder.deb  build failed.  Aborting.
	echo
	echo
fi

echo
echo
echo Done!
echo

