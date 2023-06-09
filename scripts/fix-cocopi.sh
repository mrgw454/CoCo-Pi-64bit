#!/bin/bash

clear

echo "This script will resolve any minor issues that need to be addressed for the CoCo-Pi distribution."
echo
read -p "Press any key to continue or [CTRL-C] to abort..." -n1 -s
echo
echo

backupdate=$(date +"%Y%m%d_%H%M%S")

if [ -e "$HOME/update/.fix-cocopi-skip-config-clobber" ]; then
	echo "Skipping update of /boot/config.txt - If you want this update then go to the Utilities->Administration menu and select Toggle Raspberry PI config.txt updates"
	echo
	read -p "Press any key to continue... " -n1 -s
	echo
else

	# detect model of Raspberry Pi
	RPI=`cat /proc/device-tree/model | cut -c14-16`

	if [ "$RPI" == "400" ]; then

        #sudo cp /home/pi/update/config.txt.RPi400 /boot/config.txt
        echo

	fi

	if [ "$RPI" == "4 M" ]; then

        #sudo cp /home/pi/update/config.txt.RPi4 /boot/config.txt
        echo

	fi

	if [ "$RPI" == "3 M" ]; then

        #sudo cp /home/pi/update/config.txt.RPi3 /boot/config.txt
        echo

	fi

fi


echo

# set hotfixes file
file="$HOME/update/cocopi-fixes.txt"
# create the file if it doesn't exist
touch $file



# update ugBasic
# check for fix
fix="fix-20230606-01"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo
    tar xzf /home/pi/update/ugBasic-git-20230606-CoCoPi.tar.gz -C /

	cd $HOME/source/ugbasic/ugbc/exe
	sudo cp ugbc.coco /usr/local/bin
	sudo cp ugbc.d64 /usr/local/bin
	sudo cp ugbc.d32 /usr/local/bin

	cd $HOME

    echo "$fix" >>$file
    echo
fi


# add AUTOEXEC programs to support large HDD with YADOS
# check for fix
fix="fix-20230607-01"
if grep -q "$fix" $file; then
	echo fix $fix already complete.
	echo
else
	echo Applying fix $fix...
	echo
	if [ ! -d /media/share1/DW4/AUTOEXEC ]; then

		mkdir /media/share1/DW4/AUTOEXEC
	fi

	unzip -o -j $HOME/update/AUTOEXEC.zip -d /media/share1/DW4/AUTOEXEC
	echo "$fix" >>$file
	echo
fi


# add RVPN support utilities
# check for fix
fix="fix-20230607-02"
if grep -q "$fix" $file; then
	echo fix $fix already complete.
	echo
else
	echo Applying fix $fix...
	echo
	sudo apt install lynx

	tar xzf /home/pi/update/RVPN-support-20230607.tar.gz -C /	

	cp $HOME/update/Bookmarks $HOME/.config/chromium/Default
	cp $HOME/update/Preferences $HOME/.config/chromium/Default
	echo "$fix" >>$file
	echo
fi


# update misc
# check for fix
fix="fix-20230607-03"
if grep -q "$fix" $file; then
	echo fix $fix already complete.
	echo
else
	echo Applying fix $fix...
	echo
	cp $HOME/update/install_prereqs.sh $HOME/source
	echo "$fix" >>$file
	echo
fi


# add Frank Hogg's Color FLEX option for XRoar
# check for fix
fix="fix-20230609-01"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo
    tar xzf /home/pi/update/color-flex-5.0.4-frank-hogg-laboratory.tar.gz -C /

    echo "$fix" >>$file
    echo
fi



echo

echo
echo Please reboot as soon as possible so all updates can be applied.  Thank you.
echo
read -p "Press any key to continue... " -n1 -s

echo
echo Done!
echo
