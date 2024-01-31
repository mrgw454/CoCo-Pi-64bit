#!/bin/bash

cd $HOME/source

# if a previous mlbr folder exists, move into a date-time named folder

if [ -d "mlbr" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "mlbr" "mlbr-$foldername"

        echo -e Archiving existing mlbr folder ["mlbr"] into backup folder ["mlbr-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/ogdenpm/mlbr
git clone https://github.com/ogdenpm/mlbr.git

cd mlbr

sed -i 's|_mkgmtime|gmtime|' uncrunch.c

if [ $? -eq 0 ]
then
  echo "Successfully modified $HOME/source/mlbr/uncrunch.c"
else
  echo "Failure to modifiy $HOME/source/mlbr/uncrunch.c" >&2
  echo
  exit 1
fi

GITREV=`git rev-parse --short HEAD`

gcc -o mlbr *.c

if [ -f mlbr ]; then
	sudo cp mlbr /usr/local/bin
else
	echo mlbr binary not found!
	echo
fi
cd ..

echo
echo Done!
