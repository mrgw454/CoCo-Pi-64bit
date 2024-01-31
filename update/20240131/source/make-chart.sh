#!/bin/bash

cd $HOME/source

# if a previous chart folder exists, move into a date-time named folder

if [ -d "chart" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "chart" "chart-$foldername"

        echo -e Archiving existing chart folder ["chart"] into backup folder ["chart-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/yggdrasilradio/chart
git clone https://github.com/yggdrasilradio/chart.git

cd chart

GITREV=`git rev-parse --short HEAD`

mv redistribute chart
cd chart

makeDSK-pyDW.sh

if [ -f chart.DSK ]; then
	if [ ! -d /media/share1/SDC/ADAMS ]; then
		mkdir /media/share1/SDC/ADAMS
		echo "cp chart.DSK /media/share1/SDC/ADAMS"
		echo
		cp chart.DSK /media/share1/SDC/ADAMS
	fi
else
	echo chart.DSK image not found!
	echo
fi


cd ../..

echo
echo Done!

