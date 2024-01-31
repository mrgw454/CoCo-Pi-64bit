#!/bin/bash

# https://github.com/n6il/pyDriveWire
# https://github.com/n6il/pyDriveWire/blob/master/docs/pyDriveWire%20General%20Installation%20Instructions.md

# check if python2 packages required by pyDriveWire exist

if [ -d $HOME/.pyenv/versions/pypy2.7-7.3.11/site-packages/serial ]; then
	echo serial exists.
	echo
else
	echo serial does not exist.
	echo
fi

if [ -d $HOME/.pyenv/versions/pypy2.7-7.3.11/site-packages/paramiko ]; then
	echo paramiko exists.
	echo
else
	echo reportlab does not exist.
	echo
fi

if [ -d $HOME/.pyenv/versions/pypy2.7-7.3.11/site-packages/reportlab ]; then
	echo reportlab exists.
	echo
else
	echo reportlab does not exist.
	echo
fi

if [ -f $HOME/.pyenv/versions/pypy2.7-7.3.11/site-packages/playsound.py ]; then
	echo playsound exists.
	echo
else
	echo playsound does not exist.
	echo
fi

echo
echo

pyenv local pypy2.7-7.3.11

echo "cython<3" > /tmp/constraint.txt
PIP_CONSTRAINT=/tmp/constraint.txt pypy -m pip install serial paramiko reportlab playsound
rm /tmp/constraint.txt


# install pyDriveWire
cd $HOME/source

# remove symbolic link if it exists
if [ -L $HOME/pyDriveWire ]; then
        rm $HOME/pyDriveWire
fi

# if a previous pyDriveWire-git folder exists, move into a date-time named folder
if [ -d "pyDriveWire-git" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

	# backup config file
	if [ -f pyDriveWire-git/config/pydrivewirerc-daemon ]; then
		echo Found existing config file.  Backing up to ./pydrivewirerc-daemon-$foldername
		echo
		cp pyDriveWire-git/config/pydrivewirerc-daemon ./pydrivewirerc-daemon-$foldername
		echo
	fi

	# backup script files
	cp pyDriveWire-git/pyDW.sh ./
	cp pyDriveWire-git/start_pyDW.sh ./
	cp pyDriveWire-git/status_pyDW.sh ./
	cp pyDriveWire-git/stop_pyDW.sh ./


        mv "pyDriveWire-git" "pyDriveWire-git-$foldername"

        echo -e Archiving existing pyDriveWire-git folder ["pyDriveWire-git"] into backup folder ["pyDriveWire-git-$foldername"]
        echo -e
        echo -e
fi

echo
echo

git clone https://github.com/n6il/pyDriveWire.git pyDriveWire-git

cd pyDriveWire-git

GITREV=`git rev-parse --short HEAD`

# restore backed up config file
if [ -f ../pydrivewirerc-daemon-$foldername ]; then
	echo Found existing config file.  Restoring ../pydrivewirerc-daemon-$foldername to config/pydrivewirerc-daemon
	echo
	cp ../pydrivewirerc-daemon-$foldername config/pydrivewirerc-daemon
	echo
	echo
else
	echo No existing config file.  Copying from CoCo-Pi-Installer...
	tar zxvf $HOME/CoCo-Pi-Installer/pyDriveWire-files.tar.gz --strip-components 3 home/pi/pyDriveWire/config/pydrivewirerc-daemon -C $HOME/pyDriveWire/config
	echo
	echo
fi


# restore script files
if [ -f ../pyDW.sh ]; then
	cp ../pyDW.sh ./
else
	tar zxvf $HOME/CoCo-Pi-Installer/pyDriveWire-files.tar.gz --strip-components 3 home/pi/pyDriveWire/pyDW.sh -C $HOME/pyDriveWire
fi


if [ -f ../start_pyDW.sh ]; then
	cp ../start_pyDW.sh ./
else
	tar zxvf $HOME/CoCo-Pi-Installer/pyDriveWire-files.tar.gz --strip-components 3 home/pi/pyDriveWire/start_pyDW.sh -C $HOME/pyDriveWire
fi


if [ -f ../status_pyDW.sh ]; then
	cp ../status_pyDW.sh ./
else
	tar zxvf $HOME/CoCo-Pi-Installer/pyDriveWire-files.tar.gz --strip-components 3 home/pi/pyDriveWire/status_pyDW.sh -C $HOME/pyDriveWire
fi


if [ -f ../stop_pyDW.sh ]; then
	cp ../stop_pyDW.sh ./
else
	tar zxvf $HOME/CoCo-Pi-Installer/pyDriveWire-files.tar.gz --strip-components 3 home/pi/pyDriveWire/stop_pyDW.sh -C $HOME/pyDriveWire
fi


cd ..

# create new symbolic links
ln -s $HOME/source/pyDriveWire-git $HOME/pyDriveWire

if [ ! -L $HOME/.pydrivewirerc ]; then
	ln -s $HOME/pyDriveWire/config/pydrivewirerc-daemon $HOME/.pydrivewirerc
fi

pyenv global pypy2.7-7.3.11

echo
echo
echo Done!
echo
