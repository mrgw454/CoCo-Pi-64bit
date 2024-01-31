#!/bin/bash

# set some variables
SYSTEM=coco3

cd $HOME/source

# if a previous FUZIX-$SYSTEM folder exists, move into a date-time named folder

if [ -d "FUZIX-$SYSTEM" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "FUZIX-$SYSTEM" "FUZIX-$SYSTEM-$foldername"

        echo -e Archiving existing FUZIX-$SYSTEM folder ["FUZIX-$SYSTEM"] into backup folder ["FUZIX-$SYSTEM-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/EtchedPixels/FUZIX
git clone https://github.com/EtchedPixels/FUZIX.git FUZIX-$SYSTEM
cd $HOME/source/FUZIX-$SYSTEM

git pull

# search for string and replace
sed -i 's/TARGET=rc2014/TARGET=coco3/' $HOME/source/FUZIX-$SYSTEM/Makefile
if [ $? -eq 0 ]
then
  echo "Successfully modified $HOME/source/FUZIX-$SYSTEM/Makefile"
else
  echo "Failure to modifiy $HOME/source/FUZIX-$SYSTEM/Makefile" >&2
  echo
  exit 1
fi


make

cd $HOME/source/FUZIX-$SYSTEM
make diskimage


# if disk images exist, copy them to appropriate folder
if [ -f "$HOME/source/FUZIX-$SYSTEM/Images/coco3/emu-ide.img" ]; then
	cp $HOME/source/FUZIX-$SYSTEM/Images/coco3/emu-ide.img /media/share1/DW4/GORDON/FUZIX
	ln -s /media/share1/DW4/GORDON/FUZIX/emu-ide.img /media/share1/DW4/GORDON/FUZIX/fuzixfs.dsk
else
	echo
	echo "$HOME/source/FUZIX-$SYSTEM/Images/coco3/emu-ide.img" does not exist.  Aborting.
	echo
	exit 1
fi


if [ -f "$HOME/source/FUZIX-$SYSTEM/Images/coco3/disk.img" ]; then
	cp $HOME/source/FUZIX-$SYSTEM/Images/coco3/disk.img /media/share1/SDC/GORDON/FUZIX
	ln -s /media/share1/SDC/GORDON/FUZIX/emu-ide.img /media/share1/SDC/GORDON/FUZIX/fuzixfs.dsk
else
	echo
	echo "$HOME/source/FUZIX-$SYSTEM/Images/coco3/disk.img" does not exist.  Aborting.
	echo
	exit 1
fi


if [ -f "$HOME/source/FUZIX-$SYSTEM/Kernel/platform/platform-coco3/fuzix.dsk" ]; then
	cp $HOME/source/FUZIX-$SYSTEM/Kernel/platform/platform-coco3/fuzix.dsk /media/share1/DW4/GORDON/FUZIX
	ln -s /media/share1/DW4/GORDON/FUZIX/fuzix.dsk /media/share1/DW4/GORDON/FUZIX/boot.dsk
	
	cp $HOME/source/FUZIX-$SYSTEM/Kernel/platform/platform-coco3/fuzix.dsk /media/share1/SDC/GORDON/FUZIX
	ln -s /media/share1/SDC/GORDON/FUZIX/fuzix.dsk /media/share1/SDC/GORDON/FUZIX/boot.dsk
else
        echo
        echo "$HOME/source/FUZIX-$SYSTEM/Kernel/platform/platform-coco3/fuzix.dsk" does not exist.  Aborting.
        echo
        exit 1
fi

cp $HOME/source/FUZIX-$SYSTEM/Kernel/platform/platform-coco3/README.md /media/share1/DW4/GORDON/FUZIX
cp $HOME/source/FUZIX-$SYSTEM/Kernel/platform/platform-coco3/README.md /media/share1/SDC/GORDON/FUZIX

echo
echo Done!

