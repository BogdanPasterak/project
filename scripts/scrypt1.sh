#!/bin/bash

# first script

# colors to print
BLACK='\033[0;30m'
DARK_GRAY='\033[1;30m'
RED='\033[0;31m'
LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
BROWN_ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
PURPLE='\033[0;35m'
LIGHT_PURPLE='\033[1;35m'
CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
LIGHT_GRAY='\033[0;37m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# path variable
SOUR="./../source/";
DEST="./../destination/";

# clear screen
clear
./delete.sh

# list of file to commpress
LIST_FILE=$(eval "ls ${SOUR}");

# make archiwe file in destination folder
for FILE_NAME in $LIST_FILE
do
    # compress all files with 5 different algorytm 

    ## zip
    COMMAND="zip -9q ${DEST}${FILE_NAME}.zip ${SOUR}${FILE_NAME}"
    eval $COMMAND

    ## gzip
    COMMAND="gzip -c9 --synchronous ${SOUR}${FILE_NAME} > ${DEST}${FILE_NAME}.gz"
    eval $COMMAND

    ## bzip2
    COMMAND="bzip2 -zfkc9 ${SOUR}${FILE_NAME} > ${DEST}${FILE_NAME}.bz2"
    eval $COMMAND

    ## xz
    COMMAND="xz -fkqc9 ${SOUR}${FILE_NAME} > ${DEST}${FILE_NAME}.xz"
    eval $COMMAND

done




    # COMMAND="zip -v9 ${DEST}sz6.txt.zip ${SOUR}sample6.txt"
    # echo $COMMAND
    # # cut beefore % and 
    # OUTPUT=$(eval $COMMAND 2>&1); # | cut -d'%' -f 1 | rev | cut -b 1-5 | rev
    # OUTPUT=${OUTPUT%%%*};
    # OUTPUT=${OUTPUT: -5};
    # echo "Wynik zip = ${OUTPUT}";






# for FILE_NAME in $LIST_FILE
# do
    # name file in color
#    echo -e "\n${LIGHT_GREEN}${FILE_NAME}${NC}";
    # ORGIN=$(eval "ls -l ${SOUR}${FILE_NAME} | cut -d' ' -f 5");
    # COMPR=$(eval "ls -l ${DEST}${FILE_NAME}.gz | cut -d' ' -f 5");
    # SAVE=$((ORGIN - COMPR));
    # PROC=$((SAVE * 100 / ORGIN));
#    echo "Size reduction -> ${ORGIN} - ${COMPR} = ${SAVE} -> ${PROC}%"
    ## print text from file
    # cat "$SOUR$FILE_NAME";
    # echo -e "\n";

# done
