#!/bin/bash

cd $HOME/source

# if a previous multicomp6809 folder exists, move into a date-time named folder

if [ -d "multicomp6809" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "multicomp6809" "multicomp6809-$foldername"

        echo -e Archiving existing multicomp6809 folder ["multicomp6809"] into backup folder ["multicomp6809-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/n6il/multicomp6809
git clone https://github.com/n6il/multicomp6809.git

cd multicomp6809

cd ..


echo
echo Done!

