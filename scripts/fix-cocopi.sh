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



# example placeholder
# check for fix
#fix="fix-20231023-01"
#if grep -q "$fix" $file; then
#    echo fix $fix already complete.
#    echo
#else
#    echo Applying fix $fix...
#    echo
#    tar xzf /home/pi/update/sdboot-git-20231022-CoCoPi.tar.gz -C /

#    cd $HOME

#    echo "$fix" >>$file
#    echo
#fi


# update backupEMUConfigs script
# check for fix
fix="fix-20231027-01"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo
    cp /home/pi/update/20231027/backupEMUConfigs.sh /home/pi/scripts

    cd $HOME

    echo "$fix" >>$file
    echo
fi


# update makeDSK-XRoar script
# check for fix
fix="fix-20231027-02"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo
    cp /home/pi/update/20231027/makeDSK-XRoar.sh /home/pi/scripts

    cd $HOME

    echo "$fix" >>$file
    echo
fi


# update compile scripts and stage geany 2.0
# check for fix
fix="fix-20231027-03"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo
	sudo apt install libgtk-3-dev
	
	sudo ln -s /usr/share/intltool-debian/intltool-extract /usr/local/bin/intltool-extract
	sudo ln -s /usr/share/intltool-debian/intltool-merge /usr/local/bin/intltool-merge
	sudo ln -s /usr/share/intltool-debian/intltool-update /usr/local/bin/intltool-update
      
    tar zxf /home/pi/update/20231027/geany-2.0-20231027-CoCoPi.tar.gz -C /

	#sudo apt remove geany geany-common
	
	#cd /home/pi/source/geany-2.0
	#sudo make install

	#cd /home/pi/source/geany-plugins-2.0
	#sudo make install
	
	cp /home/pi/update/20231027/compile-ugBasic-coco.sh /home/pi/scripts
	cp /home/pi/update/20231027/compile-BASIC-mc10.sh /home/pi/scripts
	
    cd $HOME

    echo "$fix" >>$file
    echo
fi


# add HOWTO file for compiling new geany 2.0
# check for fix
fix="fix-20231027-04"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo
	
	cp /home/pi/update/20231027/HOWTO-compile-geany-2.0_and_geany-plugins-2.0.txt /home/pi/source
	
    cd $HOME

    echo "$fix" >>$file
    echo
fi


# fix RDP connection issue
# check for fix
fix="fix-20231027-05"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo
	
	sudo adduser xrdp ssl-cert
	sudo cp /etc/X11/xrdp/xorg.conf /etc/X11/xrdp/xorg.conf.backup.original
	sudo sed -i 's/Option "DRMDevice" "\/dev\/dri\/renderD128"/Option "DRMDevice" ""/' /etc/X11/xrdp/xorg.conf
	
    cd $HOME

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
