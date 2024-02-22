#!/bin/bash

# install prerequisites
sudo apt -y install jam

cd $HOME/source

# if a previous coco3-jaggies folder exists, move into a date-time named folder

if [ -d "coco3-jaggies" ]; then
	foldername=$(date +%Y-%m-%d_%H.%M.%S)
       	mv "coco3-jaggies" "coco3-jaggies-$foldername"

       	echo -e Archiving existing coco3-jaggies folder ["coco3-jaggies"] into backup folder ["coco3-jaggies-$foldername"]
       	echo -e
       	echo -e
fi

# https://github.com/jaggies/coco3
git clone https://github.com/jaggies/coco3.git coco3-jaggies

cd coco3-jaggies

GITREV=`git rev-parse --short HEAD`

sed -i 's/triangles/triangle/' apps/Jamfile
sed -i 's/triangles/triangle/' apps/triangles/Jamfile
sed -i 's/TRIANGLES/TRIANGLE/' apps/triangles/Jamfile

mv apps/triangles/triangles.c apps/triangles/triangle.c
mv apps/triangles apps/triangle

jam

if [ $? -eq 0 ]
then
        echo "build process was successful"
        echo
else
        echo "build process was NOT successful.  Some programs may have had come errors."
        echo
fi

if [ ! -d /media/share1/SDC/JAGGIES ]; then
	mkdir -p /media/share1/SDC/JAGGIES
fi

find . -iname "*.dsk" -exec cp {} /media/share1/SDC/JAGGIES \;

cd ..


echo
echo Done!
