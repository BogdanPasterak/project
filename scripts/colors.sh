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


for VAL in {0..255}
do # 24 Colors (gray scale)
    # Display the color 232 240 247 and 255 , 1 of 4 , 6 number
    COLOR=$((($VAL % 24) / 6))
    COLOR=$((($COLOR * 7) + (($COLOR + 1) / 2) + 232))
    # the number represents one of the 10 ranges
    CHAR=$(($VAL / 24))
    if [[ $CHAR -eq 10 ]]; then CHAR=9; fi
    CHAR="3${CHAR}"
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

hexdump -v -e '/1 "%u\n"' inn | while read DATA
do
    value_character_dec $DATA
done

exit 0
