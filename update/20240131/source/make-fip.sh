#!/bin/bash

cd $HOME/source

# if a previous fip folder exists, move into a date-time named folder

if [ -d "fip" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "fip" "fip-$foldername"

        echo -e Archiving existing fip folder ["fip"] into backup folder ["fip-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/beretta42/fip
git clone https://github.com/beretta42/fip.git
cd fip

git pull

# perform some fixes

# search for string and replace
sed 's/REL = 0.3pre1/REL = 0.5/' $HOME/source/fip/Makefile
if [ $? -eq 0 ]
then
  echo "Successfully modified $HOME/source/fip/Makefile"
else
  echo "Failure to modifiy $HOME/source/fip/Makefile" >&2
  echo
  exit 1
fi


# search for string and add a new line below prefixed with a tab
sed -i '/\/Standalone\/filesystem-src/ a \\texport TARGET=coco3; \\' $HOME/source/fip/Makefile
if [ $? -eq 0 ]
then
  echo "Successfully modified $HOME/source/fip/Makefile"
else
  echo "Failure to modifiy $HOME/source/fip/Makefile" >&2
  echo
  exit 1
fi


# search for string and replace
sed -i 's/FUZIX_DIR = \/home\/beretta\/C\/FUZIX/FUZIX_DIR = \/home\/ron\/source\/FUZIX-fip/' $HOME/source/fip/config.mk
if [ $? -eq 0 ]
then
  echo "Successfully modified $HOME/source/fip/config.mk"
else
  echo "Failure to modifiy $HOME/source/fip/config.mk" >&2
  echo
  exit 1
fi


# search for string and replace in 2 occurances
sed -i 's|Kernel\/platform-coco3|Kernel\/platform\/platform-coco3|' $HOME/source/fip/boot/Makefile
if [ $? -eq 0 ]
then
  echo "Successfully modified $HOME/source/fip/boot/Makefile"
else
  echo "Failure to modifiy $HOME/source/fip/boot/Makefile" >&2
  echo
  exit 1
fi


# copy required ROM files over prior to building Fuzix
if [ ! -d "$HOME/source/fip/cbe/roms" ]; then
	echo "$HOME/source/fip/cbe/roms" folder does not exist.  Creating.
	mkdir "$HOME/source/fip/cbe/roms"
	echo
fi


if [ -f "$HOME/source/toolshed-code/cocoroms/bas13.rom" ]; then
	cp $HOME/source/toolshed-code/cocoroms/bas13.rom $HOME/source/fip/cbe/roms/basic.rom
else
	echo
	echo "$HOME/source/toolshed-code/cocoroms/bas13.rom" does not exist.  Aborting.
	echo
	exit 1
fi


if [ -f "$HOME/source/toolshed-code/cocoroms/disk11.rom" ]; then
	cp $HOME/source/toolshed-code/cocoroms/disk11.rom $HOME/source/fip/cbe/roms/disk.rom
else
	echo
	echo "$HOME/source/toolshed-code/cocoroms/disk11.rom" does not exist.  Aborting.
	echo
	exit 1
fi


if [ -f "$HOME/source/toolshed-code/cocoroms/extbas11.rom" ]; then
	cp $HOME/source/toolshed-code/cocoroms/extbas11.rom $HOME/source/fip/cbe/roms/ecb.rom
else
	echo
	echo "$HOME/source/toolshed-code/cocoroms/extbas11.rom" does not exist.  Aborting.
	echo
	exit 1
fi


make

# if disk images exist, copy them to appropriate folder
if [ -f "$HOME/source/FUZIX-fip/Standalone/filesystem-src/fuzixfs.dsk" ]; then
	cp $HOME/source/FUZIX-fip/Standalone/filesystem-src/fuzixfs.dsk  /media/share1/DW4/GORDON/FUZIX
	cp $HOME/source/FUZIX-fip/Standalone/filesystem-src/fuzixfs.dsk  /media/share1/SDC/GORDON/FUZIX
else
	echo
	echo "$HOME/source/FUZIX-fip/Standalone/filesystem-src/fuzixfs.dsk" does not exist.  Aborting.
	echo
	exit 1
fi


if [ -f "$HOME/source/fip/boot/boot.dsk" ]; then
	cp $HOME/source/fip/boot/boot.dsk  /media/share1/DW4/GORDON/FUZIX
	cp $HOME/source/fip/boot/boot.dsk  /media/share1/SDC/GORDON/FUZIX
else
        echo
        echo "$HOME/source/fip/boot/boot.dsk" does not exist.  Aborting.
        echo
        exit 1
fi


if [ -f "$HOME/source/fip/boot/boot2.dsk" ]; then
	cp $HOME/source/fip/boot/boot2.dsk  /media/share1/DW4/GORDON/FUZIX
	cp $HOME/source/fip/boot/boot2.dsk  /media/share1/SDC/GORDON/FUZIX
else
        echo
        echo "$HOME/source/fip/boot/boot2.dsk" does not exist.  Aborting.
        echo
        exit 1
fi


cp $HOME/source/fip/README.dist /media/share1/DW4/GORDON/FUZIX
cp $HOME/source/fip/README.dist /media/share1/SDC/GORDON/FUZIX


echo
echo Done!

