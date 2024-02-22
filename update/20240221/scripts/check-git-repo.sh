#!/bin/bash

shopt -s globstar
shopt -s extglob
shopt -s nocasematch

currentDIR=$PWD

RED='\033[0;31m'
RED_BOLD='\033[1;31m'
GREEN='\033[0;32m'
GREEN_BOLD='\033[1;32m'
YELLOW='\033[0;33m'
YELLOW_BOLD='\033[1;33m'
BLUE='\033[34m'
BLUE_BOLD='\033[1;34m'
NC='\033[0m' # no color


for d in *; do

	if [ -d "$d" ]; then

		cd "$d"

		# if .git folder exists, get repo info
		if [ -d ".git" ]; then

			giturl=$(git config --get remote.origin.url)
			git remote update > /dev/null

			if git status | grep "Your branch is behind" > /dev/null; then
				echo -e "$d - ${GREEN_BOLD}$giturl.${NC}"
				gitstatus=$(git status | grep "Your branch is behind")
				echo -e "${GREEN_BOLD}$gitstatus${NC}"
				count_update=$((count_update+1))

			else
				echo -e "$d - ${BLUE_BOLD}$giturl.${NC}"
				gitstatus=$(git status | grep "Your branch is up to date")
				echo -e "${BLUE_BOLD}$gitstatus${NC}"
				count_same=$((count_same+1))
			fi

			echo
			echo

			count_total=$((count_total+1))

		fi

	fi

	cd $currentDIR

done

shopt -u nocaseglob
shopt -u globstar
shopt -u nocasematch

echo
echo
echo -e "${GREEN_BOLD}git repositories that have pending updates    : $count_update${NC}"
echo -e "${BLUE_BOLD}git repositories that have NO pending updates : $count_same${NC}"
echo "total git repositories processed              : $count_total"
echo

echo Done!
