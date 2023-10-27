#!/bin/bash

# script to compile ugBasic programs for the CoCo.

# syntax example:

# ./compile-ugBasic-coco.sh <FILE> <COCO MODEL> <EMULATOR>


# parse command line parameters for standard help options

if [[ $1 =~ --h|--help|-h ]];then

    echo -e
    echo -e "Example syntax:"
    echo -e
    echo -e "./$scriptname <FILE> <COCO MODEL> <EMULATOR>"
    echo -e
    exit 1

fi

# set up some variables
filename=$(basename -- "$1")
dir=$(dirname -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"
workdir=$(pwd)


# remove existing files 
if [ -f "$workdir/$filename.dsk" ]; then
	rm "$workdir/$filename.dsk"
fi


# compile ugBasic program

if [[ $2 =~ coco2 ]];then

	/usr/local/bin/ugbc.coco -O dsk $workdir/$filename.$extension -o $workdir/$filename.dsk

fi

if [[ $2 =~ coco3 ]];then

	/usr/local/bin/ugbc.coco3 -O dsk $workdir/$filename.$extension -o $workdir/$filename.dsk

fi


# launch emulator
if [ -f "$workdir/$filename.dsk" ]; then

	# launch emulator and mount DSK image
	if [[ $3 =~ mame ]];then
		$HOME/.mame/$2-decb.sh $filename.dsk
	fi

	if [[ $3 =~ xroar ]];then
		$HOME/.xroar/$2-decb-xroar.sh $workdir/$filename.dsk
	fi

	if [[ $3 =~ trs80gp ]];then
		$HOME/.trs80gp/coco2-decb-trs80gp.sh $workdir/$filename.dsk
	fi

else

	echo "$workdir/$filename.dsk" does not existing.  Not launching $2.
	echo

fi


echo -e
echo -e "Done."
echo -e

exit 1
