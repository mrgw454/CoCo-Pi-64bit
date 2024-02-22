#!/bin/bash

find . -iname '*.rar' -exec sh -c 'unrar x -o+ -op"${0%.*}" "$0"' '{}' ';'
#find . -iname "*.rar" -delete

echo
echo Done!
echo
