#!/usr/bin/env bash

path_in="$1";

# test input path
if [ ! -f $path_in ]; then 
    echo -e "first argument needs to give the path to a file"
    exit 1
fi

convert -density 300 "${path_in}" -quality 70 -background white -alpha remove "${path_in}.png";

echo -e "<fertig>"
exit
