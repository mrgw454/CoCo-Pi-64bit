#!/bin/bash

# script to create new MC-10 WAV and C10 images and copy MC-10 related files to them.
# It will also (optionally) run an emulator with the image mounted 

# syntax example:

# ./makeWAV-mc10.sh <MC-10 MODEL> <EMULATOR>

# Define function for displaying error codes from Toolshed's 'cecb' command
functionErrorLevel() {

        if [ $? -eq 0 ]
	then

                echo -e "Successfully copied file to WAV image."
                echo -e

        else

                echo -e "Error during copy process to WAV image."
                echo -e
                # read -p "Press any key to continue... " -n1 -s
		echo -e
		echo -e

        fi

}

# get name of script and place it into a variable
scriptname=`basename "$0"`

# get name of current folder and place it into a variable
cassette=`basename "$PWD"`

workdir=$(pwd)


# parse command line parameters for standard help options
if [[ $1 =~ --h|--help|-h ]];then

    echo -e
    echo -e "Example syntax:"
    echo -e
    echo -e "./$scriptname <MC-10 MODEL> <EMULATOR>"
    echo -e
    exit 1

fi


# remove existing .WAV files
if [ -f "$cassette.WAV" ]; then
    echo -e
    echo Previous "$cassette.WAV" file exists.  Deleting.
    rm "$cassette.WAV"
fi

# remove existing .C10 files
if [ -f "$cassette.C10" ]; then
    echo -e
    echo Previous "$cassette.C10" file exists.  Deleting.
    rm "$cassette.C10"
fi


# create new cassette images based on current folder name
echo -e Creating new cassette images [$cassette.WAV] and [$cassette.C10] 
echo -e

cecb bulkerase "$cassette.WAV"
cecb bulkerase "$cassette.C10"

# ignore file extension case
shopt -s nocasematch

for f in *; do

	# Copy all BASIC files (and convert names to UPPERCASE) to WAV file
	if [[ $f == *.BAS ]]; then

		echo -e cecb -z copy -0 -a -l -t "$f" "$cassette.WAV","${cassette^^}"
		echo -e cecb -z copy -0 -a -l -t "$f" "$cassette.C10","${cassette^^}"
		cecb -z copy -0 -a -l -t "$f" "$cassette.WAV","${cassette^^}"
		cecb -z copy -0 -a -l -t "$f" "$cassette.C10","${cassette^^}"
		functionErrorLevel

	fi


	# Copy all BINARY files (and convert names to UPPERCASE) to WAV file
	if [[ $f == *.BIN ]]; then

		echo -e cecb -z copy -2 -b "$f" "$cassette.WAV","${f%%.*}"
		echo -e cecb -z copy -2 -b "$f" "$cassette.C10","${f%%.*}"
		cecb -z copy -2 -b "$f" "$cassette.WAV","${f%%.*}"
		cecb -z copy -2 -b "$f" "$cassette.C10","${f%%.*}"
		functionErrorLevel

	fi


	# Copy all TEXT files (and convert names to UPPERCASE) to WAV file
	if [[ $f == *.TXT ]]; then

		echo -e cecb -z copy -3 -a "$f" "$cassette.WAV","${cassette^^}"
		echo -e cecb -z copy -3 -a "$f" "$cassette.C10","${cassette^^}"		
		cecb -z copy -3 -a "$f" "$cassette.WAV","${cassette^^}"
		cecb -z copy -3 -a "$f" "$cassette.C10","${cassette^^}"
		functionErrorLevel

	fi

done

echo -e

# list cassette image contents
cecb fstat "$cassette.WAV","${cassette^^}"
echo -e


# if no parameters, only make disk image and exit
if [ $# -eq 0 ]
  then
    echo -e "Only made cassette images as no command line parameters supplied"

	echo -e
	echo -e "Done."
	echo -e

	exit 1

fi


# launch emulator
if [ -f "$cassette.WAV" ]; then

	if [ "$2" == "mame" ]; then

		# use parameter file for MAME (if found)
		MAMEPARMSFILE=`cat $HOME/.mame/.optional_mame_parameters.txt`
		export MAMEPARMS=$MAMEPARMSFILE


		# local file loading
		if [ "$1" == "mc10" ]; then

			mame -homepath $HOME/.mame $1 -cass "$PWD/$cassette.WAV" $MAMEPARMS
	
		fi


		# pyDriveWire file loading
		# make sure MAME baud rate is set to 38400
		if [ "$1" == "mcx128" ]; then

			# set pyDriveWire/EMCEE directory to where source file is located and select the proper pyDW instance
			$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw instance select 1
			$HOME/pyDriveWire/pyDwCli http://localhost:6800 mc setdir "$PWD"
			
			mame mc10 -ext $1 -rs232 null_modem -bitb socket.localhost:6809 -cass "$PWD/$cassette.WAV" $MAMEPARMS > /dev/null
	
			$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw instance select 0

			# set pyDriveWire/EMCEE directory to default location
			$HOME/pyDriveWire/pyDwCli http://localhost:6800 mc setdir /media/share1/JIMG
		
		fi

	fi
	

		if [ "$2" == "xroar" ]; then

			# use parameter file for XRoar (if found)
			XROARPARMSFILE=`cat $HOME/.xroar/.optional_xroar_parameters.txt`
			export XROARPARMS=$XROARPARMSFILE
	
			xroar -c $HOME/.xroar/xroar.conf -default-machine $1 -ram 20k -load "$PWD/$cassette.WAV" $XROARPARMS

		fi
		

		if [ "$2" == "trs80gp" ]; then

			# use parameter file for trs80gp (if found)
			TRS80GPPARMSFILE=`cat $HOME/.trs80gp/.optional_trs80gp_parameters.txt`
			export TRS80GPPARMS=$TRS80GPPARMSFILE
	
			trs80gp -mc10 $TRS80GPPARMS -c "$PWD/$cassette.C10"

		fi
		
else

	echo -e
	echo -e
	echo ERROR -- "$cassette.WAV" does not exist.  Not launching $2.
	echo -e

fi

echo -e
echo -e "Done."
echo -e

exit 1
