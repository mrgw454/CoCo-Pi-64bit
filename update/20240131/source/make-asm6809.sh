#!/bin/bash

cd $HOME/source

# if a previous asm6809-git folder exists, move into a date-time named folder

if [ -d "asm6809-git" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "asm6809-git" "asm6809-git-$foldername"

        echo -e Archiving existing asm6809-git folder ["asm6809-git"] into backup folder ["asm6809-git-$foldername"]
        echo -e
        echo -e
fi

# https://www.6809.org.uk/asm6809/
git clone https://www.6809.org.uk/git/asm6809.git asm6809-git

cd asm6809-git

GITREV=`git rev-parse --short HEAD`

./autogen.sh
./configure

make

sudo make install

cd ..

echo
echo Done!
