#!/bin/bash

cd $HOME/source

# if a previous nitros9-code folder exists, move into a date-time named folder

if [ -d "nitros9-code" ]; then

        foldername=$(date +%Y-%m-%d_%H.%M.%S)

        mv "nitros9-code" "nitros9-code-$foldername"

        echo -e Archiving existing nitros9-code folder ["nitros9-code"] into backup folder ["nitros9-code-$foldername"]
        echo -e
        echo -e
fi

# https://sourceforge.net/p/toolshed/code/ci/default/tree/
hg clone http://hg.code.sf.net/p/nitros9/code nitros9-code
cd nitros9-code

hg pull

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

