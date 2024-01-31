#!/bin/bash

sleep 2s

ps_out=`ps -ef | grep -m 1 pyDriveWire | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "$1")
if [[ "$result" != "" ]];then
    echo -e "pyDriveWire is running"
else
    echo -e "pyDriveWire is not running"
fi


ps_out=`ps -ef | grep -m 1 DW4 | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "$1")
if [[ "$result" != "" ]];then
    echo -e "DriveWire 4 is running"
else
    echo -e "DriveWire 4 is not running"
fi


ps_out=`ps -ef | grep -m 1 lwwire | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "$1")
if [[ "$result" != "" ]];then
    echo -e "lwwire is running"
else
    echo -e "lwwire is not running"
fi


ps_out=`ps -ef | grep -m 1 emceed | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "$1")
if [[ "$result" != "" ]];then
    echo -e "emceed is running"
else
    echo -e "emceed is not running"
fi

echo

cd $HOME/.mame

