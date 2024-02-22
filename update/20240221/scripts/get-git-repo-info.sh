#!/bin/bash

shopt -s globstar
shopt -s extglob
shopt -s nocasematch

currentDIR=$PWD

if [ -f get-git-repo.sh ]; then
		rm get-git-repo.sh
fi



for d in *; do
  if [ -d "$d" ]; then

	cd "$d"

	# if .git folder exists, get repo info
	if [ -d ".git" ]; then
		#echo "$d"
		giturl=$(git config --get remote.origin.url)
		paste <(printf %s "$giturl") <(printf %s "$PWD")

		#echo mkdir "$d" >> $currentDIR/get-git-repo.sh
		#echo cd "$d" >> $currentDIR/get-git-repo.sh
		echo git clone "$giturl" >> $currentDIR/get-git-repo.sh
		#echo cd .. >> $currentDIR/get-git-repo.sh
		#echo >> $currentDIR/get-git-repo.sh
		#echo >> $currentDIR/get-git-repo.sh
	fi

	cd ..

  fi
done

shopt -u nocaseglob
shopt -u globstar
shopt -u nocasematch

echo Done!
