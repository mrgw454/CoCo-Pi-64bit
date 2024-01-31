#!/bin/bash

cd $HOME/source

# if a previous vbcc folder exists, move into a date-time named folder

if [ -d "vbcc" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "vbcc" "vbcc-$foldername"

        echo -e Archiving existing vbcc folder ["vbcc"] into backup folder ["vbcc-$foldername"]
        echo -e
        echo -e
fi


# http://sun.hasenbraten.de/vbcc/
# http://www.compilers.de/vbcc.html
# http://www.pjhutchison.org/tutorial/vbcc.html

# The bin folder contains all the binaries.
# 6809 target uses vbcchc12
# Look at ./config/s6809 for setup


systemtype=$(dpkg --print-architecture)
echo architecture = $systemtype

if [[ $systemtype =~ arm64 ]];then

	if [ -f vbcc_linux_arm.tar.gz ]; then
		rm vbcc_linux_arm.tar.gz
	fi

	wget http://www.ibaug.de/vbcc/vbcc_linux_arm.tar.gz
	tar zxvf vbcc_linux_arm.tar.gz
fi


if [[ $systemtype =~ amd64 ]];then

	if [ -f vbcc_linux_x64.tar.gz ]; then
		rm vbcc_linux_x64.tar.gz
	fi

	wget http://www.ibaug.de/vbcc/vbcc_linux_x64.tar.gz
	tar zxvf vbcc_linux_x64.tar.gz
fi


cd vbcc

cd ..

echo
echo Done!
