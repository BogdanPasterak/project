#!/bin/bash
 
# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.
 
# for fgbg in 38 48 ; do # Foreground / Background
#     for color in {0..255} ; do # Colors
#         # Display the color
#         printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
#         # Display 6 colors per lines
#         if [ $((($color + 1) % 6)) == 4 ] ; then
#             echo # New line
#         fi
#     done
#     echo # New line
# done
 
# exit 0
# paraler array background and pair foreground colour
BG=(40 40 40 100 100 100 47 47 47 107 107 107)
FG=(90 37 97 30 37 97 97 90 30 37 90 30)

clear

value_character_hex () {
    VAL=$((16#$1)) # patameter hex to dec
    # Display the color 232 240 247 and 255 , 1 of 4 , 6 number
    COLOR=$((($VAL % 24) / 6))
    COLOR=$((($COLOR * 7) + (($COLOR + 1) / 2) + 232))
    # the number represents one of the 10 ranges
    CHAR=$(($VAL / 24))
    if [[ $CHAR -eq 10 ]]; then CHAR=9; fi
    CHAR="3${CHAR}"
    printf "\e[38;5;%sm\x${CHAR}\e[0m" $COLOR 
}

value_character_dec () {
    VAL=$1 # patameter hex to dec
    # Display the color 232 240 247 and 255 , 1 of 4 , 6 number
    COLOR=$((($VAL % 24) / 6))
    COLOR=$((($COLOR * 7) + (($COLOR + 1) / 2) + 232))
    # the number represents one of the 10 ranges
    CHAR=$(($VAL / 24))
    if [[ $CHAR -eq 10 ]]; then CHAR=9; fi
    CHAR="3${CHAR}"
    printf "\e[38;5;%sm\x${CHAR}\e[0m" $COLOR 
}

echo -e "PRINT PALETE from 0 to 255\n"
for VAL in {0..255}
do # 24 Colors (gray scale)
    # Display the color 232 240 247 and 255 , 1 of 4 , 6 number
    COLOR=$((($VAL % 24) / 6))
    COLOR=$((($COLOR * 7) + (($COLOR + 1) / 2) + 232))
    # the number represents one of the 10 ranges
    CHAR=$(($VAL / 24))
    if [[ $CHAR -eq 10 ]]
    then
        CHAR="41"
    else
        CHAR="3${CHAR}"
    fi
    printf "\e[38;5;%sm\x${CHAR}\e[0m" $COLOR 
    # Display 6 colors per lines
    if [ $(($VAL % 64)) == 63 ]
    then
        echo # New line
    fi
done

echo


# for INDEX in {0..30}
# do
#     DATA=$(xxd -p -l1 -s ${INDEX} inn)
#     # if [[ "$this_byte" != "" ]] # end of file
#     # then
#     #     break
#     # fi
#     value_character_hex $DATA
# done
 
echo
COUNT=-1
hexdump -v -e '/1 "%u\n"' inn | while read DATA
do
    ((COUNT=COUNT+1))
    if [ $COUNT -ge 64 ]
    then
        COUNT=0
        echo
    fi
    value_character_dec $DATA
done
echo
#                              Foreground Background     
# printf "\e[%sm\e[%sm Bogdan \e[0m\n" "30" "100"    # black / dark
# printf "\e[%sm\e[%sm Bogdan \e[0m\n" "90" "47"    # dark / light
# printf "\e[%sm\e[%sm Bogdan \e[0m\n" "37" "40"    # light / dark
# printf "\e[%sm\e[%sm Bogdan \e[0m\n" "97" "100"    # white / light
# echo


# black dark light white
for INDEX in {0..11}
do
    printf "\e[%sm\e[%sm Bogdan \e[0m\n" ${FG[$INDEX]} ${BG[$INDEX]} 
done


exit 0
