#!/bin/bash

clear

PROJECT_DIR=$HOME/source

RPiModel=$(cat $HOME/rpi-model.txt)

# show warning for RPi3 platform
if [[ $RPiModel == RPi3 ]];
then

	if [ -f $HOME/scripts/select-project-build.txt ]; then
		cat $HOME/scripts/select-project-build.txt
		echo
		echo
	fi
fi


# show currently downloaded projects
echo Existing project folders that have already been downloaded, built and/or installed:
echo
#ls -d $PROJECT_DIR/*/ | cut -f5 -d'/'
ls -d $PROJECT_DIR/*/ | cut -f5 -d'/' | sed -z 's/\n/, /g'
echo
echo


if compgen -G "${PROJECT_DIR}/make-*" > /dev/null; then
	echo
	echo "The following projects can be built from source:"
	echo

else

	echo No project build scripts current exist.  Exiting.
	echo
	exit 1
fi

# set the prompt used by select, replacing "#?"
PS3="
Please select one to build or 'stop' to cancel :"

# allow the user to choose a project
select project in $(ls $HOME/source/make-* | sed -e 's|/home/ron/source/make-||' -e 's|\.sh||')

do
	# leave the loop if the user says 'stop'
	if [[ "$REPLY" == stop ]]; then break; fi

	# complain if no project was selected, and loop to ask again
	if [[ "$project" == "" ]]
	then
		echo "'$REPLY' is not a valid project number"
		continue
	fi

	# now we can use the selected file
	echo
	echo
	echo "$project" build script was selected.
	echo
	echo Project web site:
	echo $(grep -h "# http" "$HOME/source/make-$project.sh" | cut -c 2-)
	chromium-browser $(grep -h "# http" "$HOME/source/make-$project.sh" | cut -c 2-) &> /dev/null &
	echo
	echo

	# prompting for choice
	read -p "Do you want to build the project? (y) Yes / (n) No :" choice

	# giving choices there tasks using
	case $choice in
		[yY]* ) echo "Building project..." & $HOME/source/make-$project.sh ;;
		[nN]* ) echo "NOT building project" & select-project-build.sh ;;
		*) exit ;;
	esac

	# it'll ask for another unless we leave the loop
	break
done
