#!/bin/bash

# add required packages for building/running MAME and XRoar

echo "Syncing APT mirrors..."
sudo apt-get update

echo "Removing uneeded packages..."
sudo apt-get remove avahi-daemon -y
sudo apt-get remove nfs-common -y

echo "Installing misc packages..."
sudo pip install glances
sudo apt install neofetch libssl-dev mercurial screen mc

echo "Installing packages for XRoar..."
sudo apt install build-essential libsndfile1-dev libgtk2.0-dev libgtkglext1-dev libasound2-dev

echo "Installing packages for Remote Desktop..."
sudo apt install xrdp

echo "Installing packages for DriveWire 4..."
sudo apt install openjdk-17-jdk openjdk-17-jre

echo "Installing packages for Toolshed..."
sudo apt install libfuse-dev markdown

echo "Installing packages for Tormod's 6809 Dev Tools Repo..."
sudo apt install software-properties-common
sudo add-apt-repository ppa:tormodvolden/m6809
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 627ABB1E29CC8356AD0800EB4B1E287796DD5C9A
sudo apt update
sudo apt install gcc6809

echo "Installing nodejs - needed for basic_renumber..."
sudo apt install nodejs

echo "Installing build tools..."
sudo apt-get install -y \
 aria2 \
 autoconf \
 automake \
 bison \
 build-essential \
 bzip2 \
 ccache \
 coreutils \
 curl \
 flex \
 g++ \
 gawk \
 gcc \
 git \
 gzip \
 help2man \
 libtool \
 libtool-bin \
 make \
 p7zip \
 p7zip-full \
 rsync \
 texi2html \
 texinfo \
 unzip \
 wget \
 xz-utils \
 zip \
 zstd \

echo "Installing MAME build requirements..."
sudo apt-get build-dep -y mame

echo "Installing XRoar build requirements..."
sudo apt install build-essential libsndfile1-dev libgtk2.0-dev libgtkglext1-dev libasound2-dev

echo "Installing packages for QB64..."
sudo apt install freeglut3-dev

echo "Installing packages for VGMPlay..."
sudo apt install libao-dev

echo "Installing packages for DOSBox..."
sudo apt install libsdl1.2-dev libsdl-sound1.2-dev libsdl-net1.2-dev

echo "Installing packages for irssi..."
sudo apt install irssi

echo "Installing packages for qodem..."
sudo apt install libgpm-dev

echo "Installing packages for samba..."
sudo apt install samba samba-common-bin

echo "Installing package for lynx..."
sudo apt install lynx

#sudo usermod -a -G render pi

# turn off password warning for user 'pi'
sudo rm /etc/xdg/lxsession/LXDE-pi/sshpwd.sh
sudo rm /etc/profile.d/sshpwd.sh

