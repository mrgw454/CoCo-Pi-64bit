#!/bin/bash

shopt -s globstar
shopt -s extglob
shopt -s nocasematch

currentDIR=$PWD

	if [ -d ".git" ]; then
		giturl=$(git config --get remote.origin.url)
		echo
		echo $giturl
		echo
	fi

shopt -u nocaseglob
shopt -u globstar
shopt -u nocasematch
