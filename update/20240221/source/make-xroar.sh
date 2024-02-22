#!/bin/bash

cd $HOME/source

if [ -z "$1" ]; then

	echo "No arguments provided.  Defaulting to build from git repository."
	echo

	# if a previous xroar-git folder exists, move into a date-time named folder

	if [ -d "xroar-git" ]; then

        	foldername=$(date +%Y-%m-%d_%H.%M.%S)

        	mv "xroar-git" "xroar-git-$foldername"

        	echo -e Archiving existing xroar-git folder ["xroar-git"] into backup folder ["xroar-git-$foldername"]
        	echo -e
        	echo -e
	fi

	# https://www.6809.org.uk/xroar/
	git clone https://www.6809.org.uk/git/xroar.git xroar-git

	cd xroar-git

	GITREV=`git rev-parse --short HEAD`

	./autogen.sh
	./configure

	echo $(nproc) / 2 | bc
	cores=$(echo $(nproc) / 2 | bc)
	make -j$cores

	if [ -f src/xroar ]; then
        	sudo cp src/xroar /usr/local/bin/xroar-git-$GITREV
	else
        	echo xroar binary not found!
        	echo
	fi

else

	echo $1 argument passed.  Looking for XRoar-$1...
	echo

	if [ ! -f xroar-$1.tar.gz ]; then
		wget https://www.6809.org.uk/xroar/dl/xroar-$1.tar.gz
	fi

	if [ ! -f xroar-$1.tar.gz ]; then
		echo xroar-$1.tar.gz archive file NOT found.  Aborting installation.
		echo
		exit
	fi

	tar zxvf xroar-$1.tar.gz
	cd xroar-$1

	./autogen.sh
	./configure

	echo $(nproc) / 2 | bc
	cores=$(echo $(nproc) / 2 | bc)
	make -j$cores

	if [ -f src/xroar ]; then
		sudo cp src/xroar /usr/local/bin/xroar-$1
	else
	echo xroar binary not found!
	echo
	fi


fi


echo
echo Done!

