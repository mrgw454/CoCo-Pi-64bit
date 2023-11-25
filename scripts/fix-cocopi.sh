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


# update ugBasic and ugBasic-beta
# check for fix
fix="fix-20231029-01"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo

    tar zxf /home/pi/update/20231029/ugBasic-20231029-CoCoPi.tar.gz -C /
    tar zxf /home/pi/update/20231029/ugBasic-beta-20231028-CoCoPi.tar.gz -C /

	sudo cp /home/pi/source/ugbasic/ugbc/exe/* /usr/local/bin
	sudo cp /home/pi/source/ugbasic-beta/ugbc/exe/* /usr/local/bin

	cp /home/pi/update/20231029/compile-ugBasic-coco.sh /home/pi/scripts

    cd $HOME

    echo "$fix" >>$file
    echo
fi


# update ugBasic-beta
# check for fix
fix="fix-20231101-01"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo

    tar zxf /home/pi/update/20231101/ugBasic-beta-20231101-CoCoPi.tar.gz -C /
	sudo cp /home/pi/source/ugbasic-beta/ugbc/exe/* /usr/local/bin

    cd $HOME

    echo "$fix" >>$file
    echo
fi


# update ugBasic and ugBasic-beta
# check for fix
fix="fix-20231106-01"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo

    tar zxf /home/pi/update/20231106/ugBasic-20231106-CoCoPi.tar.gz -C /
    tar zxf /home/pi/update/20231106/ugBasic-beta-20231106-CoCoPi.tar.gz -C /

    sudo cp /home/pi/source/ugbasic/ugbc/exe/* /usr/local/bin
    sudo cp /home/pi/source/ugbasic-beta/ugbc/exe/* /usr/local/bin

    cd $HOME

    echo "$fix" >>$file
    echo
fi


# update MAME CoCo 3 launch scripts
# check for fix
fix="fix-20231106-02"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo

    cp /home/pi/update/20231106/coco3-decb-6309-2MB.sh /home/pi/.mame
    cp /home/pi/update/20231106/coco3-decb.sh /home/pi/.mame

    cd $HOME

    echo "$fix" >>$file
    echo
fi


# update ugBasic and ugBasic-beta
# check for fix
fix="fix-20231108-01"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo

    tar zxf /home/pi/update/20231108/ugBasic-20231108-CoCoPi.tar.gz -C /
    tar zxf /home/pi/update/20231108/ugBasic-beta-20231108-CoCoPi.tar.gz -C /

    sudo cp /home/pi/source/ugbasic/ugbc/exe/* /usr/local/bin
    sudo cp /home/pi/source/ugbasic-beta/ugbc/exe/* /usr/local/bin

    cd $HOME

    echo "$fix" >>$file
    echo
fi


# update ugBasic and ugBasic-beta
# check for fix
fix="fix-20231114-01"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo

    tar zxf /home/pi/update/20231114/ugBasic-20231114-CoCoPi.tar.gz -C /
    tar zxf /home/pi/update/20231114/ugBasic-beta-20231114-CoCoPi.tar.gz -C /

    sudo cp /home/pi/source/ugbasic/ugbc/exe/* /usr/local/bin
    sudo cp /home/pi/source/ugbasic-beta/ugbc/exe/* /usr/local/bin

    cd $HOME

    echo "$fix" >>$file
    echo
fi


# organize geany build commands, update scripts and update to latest ugBasic (including beta)
# check for fix
fix="fix-20231121-01"
if grep -q "$fix" $file; then
   echo fix $fix already complete.
   echo
else
   echo Applying fix $fix...
   echo
   sed -i "s/number_exec_menu_items=24/number_exec_menu_items=32/" /home/pi/.config/geany/geany.conf

   tar zxf /home/pi/update/20231121/ugBasic-20231121-CoCoPi.tar.gz -C /
   tar zxf /home/pi/update/20231121/ugBasic-beta-20231121-CoCoPi.tar.gz -C /

   sudo cp /home/pi/source/ugbasic/ugbc/exe/* /usr/local/bin
   sudo cp /home/pi/source/ugbasic-beta/ugbc/exe/* /usr/local/bin

   cp /home/pi/update/20231121/filetypes* /home/pi/.config/geany/filedefs

   cp /home/pi/update/20231121/*.sh /home/pi/scripts
   echo "$fix" >>$file
   echo
fi


# installed pre-staged geany 2.0
# check for fix
fix="fix-20231125-01"
if grep -q "$fix" $file; then
    echo fix $fix already complete.
    echo
else
    echo Applying fix $fix...
    echo
	
	sudo apt remove -y geany geany-common

	cd /home/pi/source/geany-2.0
	sudo make install

	cd /home/pi/source/geany-plugins-2.0
	sudo make install

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
