#!/usr/bin/env bash

path_in="$1";

# test input path
if [ ! -d $path_in ]; then 
    echo -e "Das erste Argument enthält keinen gültigen Pfad"
    exit 1
fi

if [ ! "$(ls -A $path_in)" ]; then
    echo -e "Der Ordner ${path_in} ist leer."
    exit 1
fi

# test destination path 
if [ $# -gt 1 ]; then
    path_out="$2"
else
    path_out=${path_in}"/mini/"
fi

if [ ! -d $path_out ]; then 
    mkdir $path_out
fi

if [ "$(ls -A $path_out)" ]; then
    echo -e "Der Ordner ${path_out} ist nicht leer. \nBreche ab, um Datenverlust zu verhindern"
    exit 1
fi

echo -e "Bilder werden gesucht in ${path_in}";
echo -e "Minimierte Bilder werden geschrieben nach ${path_out}";

# the resize operation
for img in $( ls ${path_in} | grep -iE ".jpg|.JPG|.jpeg" ); do
    convert -quality 70% -resize 1920x1920 "${path_in}/${img}" "${path_out}/${img}";
done

echo -e "<fertig>"
exit
