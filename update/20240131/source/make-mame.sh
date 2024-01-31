#!/bin/bash

cd $HOME/source

# if no parameters, pull current WIP mame from git
if [ "$#" -eq 0 ]; then

	echo No arguments provided.  Setting mame version to mame-git.
	mamever=mame-git

else

	echo mame version being set to $1
	mamever=$1
	mamevernum=${mamever: -3}
fi


# if a previous mame folder exists, move into a date-time named folder
if [ -d "$mamever" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "$mamever" "$mamever-$foldername"

        echo -e Archiving existing mame folder ["$mamever"] into backup folder ["$mamever-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/mamedev/mame
if [[ "$mamever" == "mame-git" ]]
then
        echo "Pulling current WIP mame from git"
	echo git clone --depth 1 https://github.com/mamedev/mame.git $mamever
	git clone --depth 1 https://github.com/mamedev/mame.git $mamever
else
	echo Pulling "$mamever from git"
	echo git clone -b $mamever --depth 1 https://github.com/mamedev/mame.git $mamever
	git clone -b $mamever --depth 1 https://github.com/mamedev/mame.git $mamever
fi

if [ $? -eq 0 ]
then
	echo "Pull from git was successful"
	echo
else
	echo "Pull from git was not successful" >&2
	echo
	exit 1
fi

cd $mamever

echo current folder: $(pwd)
echo

GITREV=`git rev-parse --short HEAD`

# useroptions.mak file required.
if [ -f ../useroptions.mak ]; then
	cp ../useroptions.mak ./
else
	echo
	echo useroptions.mak file not found.  Building all systems.
	echo
fi

echo $(nproc) / 2 | bc
cores=$(echo $(nproc) / 2 | bc)
make -j$cores TOOLS=1 NOWERROR=1


if [ -f mame ]; then
	echo mame binary exists.  Compilation was successful.
	echo

	# remove existing symbolc link
	if [ -L /opt/mame-0.$mamevernum ]; then
		sudo rm /opt/mame-0.$mamevernum
	fi

	# create new symbolic link
	echo creating new symbolic link for /opt/mame-0.$mamevernum ...
	echo
	sudo ln -s $HOME/source/$mamever /opt/mame-0.$mamevernum

else
	echo mame binary not found!  Compilation was unsuccessful.
	echo
fi

cd ..

echo
echo Done!
