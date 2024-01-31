#!/bin/bash

cd $HOME/source

# if a previous online6809 folder exists, move into a date-time named folder

if [ -d "online6809" ]; then

       	foldername=$(date +%Y-%m-%d_%H.%M.%S)

       	mv "online6809" "online6809-$foldername"

       	echo -e Archiving existing online6809 folder ["online6809"] into backup folder ["online6809-$foldername"]
       	echo -e
       	echo -e
fi

# https://github.com/jimbro1000/online6809
# http://6809.ukdragons.org.uk/
git clone https://github.com/jimbro1000/online6809.git

cd online6809

GITREV=`git rev-parse --short HEAD`

npm install
if [ $? -eq 0 ]
then
       	echo "npm install was successful."
        echo
else
       	echo "npm install was NOT successful.  Aborting installation." >&2
       	echo
       	exit 1
fi

npm run build
if [ $? -eq 0 ]
then
       	echo "npm run build was successful."
        echo
else
       	echo "npm run build was NOT successful.  Aborting installation." >&2
       	echo
       	exit 1
fi


npx jest
if [ $? -eq 0 ]
then
       	echo "npx jest tests were successful."
        echo
else
       	echo "npx jest tests were NOT successful.  Aborting installation." >&2
       	echo
       	exit 1
fi


echo
echo To run, open index.html file in this source folder directory with a web browser.
echo


cd ..


echo
echo Done!

