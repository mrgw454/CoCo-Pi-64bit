#!/bin/bash

# https://github.com/scopatz/nanorc

cd $HOME

if [ -d $HOME/.nano ]; then
	rm -rf $HOME/.nano
	echo
fi

curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

echo

echo
echo Done!

