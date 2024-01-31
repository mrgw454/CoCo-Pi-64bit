#!/bin/bash

# https://www.freebasic.net/
# https://sourceforge.net/projects/fbc/files/FreeBASIC-1.10.1/

cd $HOME/source

# check to see if fbc is already installed
fbccheck=$(which fbc)

if [ $? -eq 0 ]
then
	echo fbc binary found.
	echo
	echo

else
	echo fbc binary not found.  Getting precompiled binary package...
	echo

	systemtype=$(dpkg --print-architecture)
	echo architecture = $systemtype

	if [[ $systemtype =~ arm64 ]];then
		curl -o FreeBASIC-binary.tar.gz -L -C - https://sourceforge.net/projects/fbc/files/FreeBASIC-1.10.1/Binaries-RaspberryPi/FreeBASIC-1.10.1-rpios11-aarch64.tar.gz/download
        fi

	if [[ $systemtype =~ amd64 ]];then
		curl -o FreeBASIC-binary.tar.gz -L -C - https://sourceforge.net/projects/fbc/files/FreeBASIC-1.10.1/Binaries-Linux/FreeBASIC-1.10.1-linux-x86_64.tar.gz/download
	fi


	if [ -f FreeBASIC-binary.tar.gz ]; then
		echo FreeBASIC-binary package archive found.
		echo

		# if a previous FreeBASIC binary package folder exists, keep it else create a new one
		if [ -d "FreeBASIC-binary" ]; then

	        	echo Existing FreeBASIC-binary folder found.
			echo
		else
        		echo Existing FreeBASIC-binary folder NOT found.  Creating...
			echo
			echo
			mkdir FreeBASIC-binary
		fi

		# extract FreeBASIC-binary package archive
		echo Extracting FreeBASIC-binary package archive...
		tar zxvf FreeBASIC-binary.tar.gz --strip-components 1 -C $HOME/source/FreeBASIC-binary
		echo
		echo

		# install pre-compiled binary
		echo Installing FreeBASIC-binary...
		cd FreeBASIC-binary
		sudo ./install.sh -i
		echo
		echo
	else
		echo FreeBASIC-binary package archive not found!  Aborting installation.
		echo
		echo
		exit 1
	fi

fi


cd $HOME/source

# if a previous fbc folder exists, move into a date-time named folder
if [ -d "fbc" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "fbc" "fbc-$foldername"

        echo -e Archiving existing fbc folder ["fbc"] into backup folder ["fbc-$foldername"]
        echo -e
        echo -e
fi


# https://github.com/freebasic/fbc
git clone https://github.com/freebasic/fbc.git

cd fbc

GITREV=`git rev-parse --short HEAD`

make

if [ -f bin/fbc ]; then
	echo fbc binary created successfully.  Installing...
        sudo make install
	echo
	echo
else
        echo fbc binary not found!  Installation aborted.
	echo
        echo
fi

cd ..

echo
echo
echo Done!
echo
