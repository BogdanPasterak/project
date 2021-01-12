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

# list of file to commpress
LIST_FILE=$(eval "ls ${SOUR}");

# make archiwe file in destination folder
for FILE_NAME in $LIST_FILE
do
    # compress all files best compres
    COMMAND="gzip -cv9 ${SOUR}${FILE_NAME} > ${DEST}${FILE_NAME}.gz"
    # echo -e "COMMAND = ${COMMAND}";
#    eval $COMMAND | cut -d' ' -f 2; # nie dziala
    # redirect stdout to file (append)
    # eval $COMMAND &>>out.txt 
    # redirect stdout to variable
    OUTPUT=$(eval $COMMAND 2>&1);
    echo "Wynik = >${OUTPUT}< koniec";
    COMMAND="bzip2 -zfkcv9 ${SOUR}${FILE_NAME} > ${DEST}${FILE_NAME}.zip"
    eval $COMMAND;
done

for FILE_NAME in $LIST_FILE
do
    # name file in color
#    echo -e "\n${LIGHT_GREEN}${FILE_NAME}${NC}";
    ORGIN=$(eval "ls -l ${SOUR}${FILE_NAME} | cut -d' ' -f 5");
    COMPR=$(eval "ls -l ${DEST}${FILE_NAME}.gz | cut -d' ' -f 5");
    SAVE=$((ORGIN - COMPR));
    PROC=$((SAVE * 100 / ORGIN));
#    echo "Size reduction -> ${ORGIN} - ${COMPR} = ${SAVE} -> ${PROC}%"
    ## print text from file
    # cat "$SOUR$FILE_NAME";
    # echo -e "\n";

done
