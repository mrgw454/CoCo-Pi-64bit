#!/bin/bash

find . -iname '*.zip' -exec sh -c 'unzip -o -d "${0%.*}" "$0"' '{}' ';'
#find . -iname "*.zip" -delete

echo
echo Done!
echo
