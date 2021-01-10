#!/bin/bash

# first script

clear

for file_name in $(ls ./source/)
do
    echo "${file_name}";
    cat "./source/$file_name";
    echo -e "\n";
done
