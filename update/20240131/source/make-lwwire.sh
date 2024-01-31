#!/bin/bash

cd $HOME/source


# remove symbolic link if it exists
if [ -L $HOME/lwwire ]; then
	rm $HOME/lwwire
fi

# if a previous lwwire folder exists, move into a date-time named folder

if [ -d "lwwire" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        # backup scripts
	echo Backing up lwwire scripts
	echo
	cp lwwire/src/edit-tcpserv.sh ./edit-tcpserv.sh-$foldername
	cp lwwire/src/serserv ./serserv-$foldername
	cp lwwire/src/startlwwire.sh ./startlwwire.sh-$foldername
	cp lwwire/src/stoplwwire.sh ./stoplwwire.sh-$foldername
	cp lwwire/src/tap-disable.sh ./tap-disable.sh-$foldername
	cp lwwire/src/tap-enable.sh ./tap-enable.sh-$foldername
	cp lwwire/src/tcpserv ./tcpserv-$foldername

        mv "lwwire" "lwwire-$foldername"

	echo
	echo Archiving existing lwwire folder ["lwwire"] into backup folder ["lwwire-$foldername"]
        echo
        echo
fi

# http://lwwire.projects.l-w.ca/hg/
hg clone http://lwwire.projects.l-w.ca/hg/ lwwire

cd lwwire/src

make

# restore lwwire scripts
echo Restoring lwwire scripts
echo
cp ../../edit-tcpserv.sh-$foldername ./edit-tcpserv.sh
cp ../../serserv-$foldername ./serserv
cp ../../startlwwire.sh-$foldername ./startlwwire.sh
cp ../../stoplwwire.sh-$foldername ./stoplwwire.sh
cp ../../tap-disable.sh-$foldername ./tap-disable.sh
cp ../../tap-enable.sh-$foldername ./tap-enable.sh
cp ../../tcpserv-$foldername ./tcpserv

cd ../..

# create new symbolic link
ln -s $HOME/source/lwwire/src $HOME/lwwire

echo
echo Done!
echo
