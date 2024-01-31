#!/bin/bash

cd $HOME/source

# if a previous nitros9 folder exists, move into a date-time named folder

if [ -d "nitros9" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "nitros9" "nitros9-$foldername"

        echo -e Archiving existing nitros9 folder ["nitros9"] into backup folder ["nitros9-$foldername"]
        echo -e
        echo -e
fi

# https://github.com/nitros9project/nitros9
git clone https://github.com/nitros9project/nitros9.git

cd nitros9

# modifications start here
sed -i 's/-t1024/-t29126 -e -ss -dd/' ./level1/coco1/makefile
sed -i 's/-t1024/-t29126 -e -ss -dd/' ./level2/coco3/makefile
sed -i 's/OS9FORMAT_DW	= $(OS9) format -t29126 -ss -dd/OS9FORMAT_DW	= $(OS9) format -e -t29126 -ss -dd/' ./rules.mak

echo 'inetd <>>>/w&' >> ./level2/coco3/startup
echo 'shell i=/w&' >> ./level2/coco3/startup
echo 'shell i=/w&' >> ./level2/coco3/startup
echo 'shell i=/w&' >> ./level2/coco3/startup
echo 'shell i=/w&' >> ./level2/coco3/startup

echo 'inetd <>>>/w&' >> ./level2/coco3/startup.dw
echo 'shell i=/w&' >> ./level2/coco3/startup.dw
echo 'shell i=/w&' >> ./level2/coco3/startup.dw
echo 'shell i=/w&' >> ./level2/coco3/startup.dw
echo 'shell i=/w&' >> ./level2/coco3/startup.dw

unzip -o ../new_windows.zip -d ./level2/modules

make
make dsk
make dskcopy

echo
echo Done!

