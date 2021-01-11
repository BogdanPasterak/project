#!/bin/bash

# clear destination folder

# path variable
DEST="./../destination/";

for FILE_NAME in $(ls ./../destination/)
do
    # name file 
    echo -e "Remove file -> ${FILE_NAME}${NC}";
    rm "${DEST}${FILE_NAME}"
done
