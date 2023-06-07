#!/bin/bash

sudo /etc/init.d/dphys-swapfile stop
sudo cp /etc/dphys-swapfile.external.20230601 /etc/dphys-swapfile

sudo dphys-swapfile setup
sudo /etc/init.d/dphys-swapfile start
sudo /etc/init.d/dphys-swapfile status

swapon -s

