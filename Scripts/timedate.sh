#!/bin/bash

#DATE=`timedatectl status | grep Local | cut -d " " -f 19 | sed 's/-/\//g'`
DATE=`date "+%d/%m/%Y"`
TIME=`timedatectl status | grep Local | cut -d " " -f 20`

dunstify -r 102 -u low -t 1500 "Date: $DATE" "Time: $TIME"
sleep 1

#DATE=`timedatectl status | grep Local | cut -d " " -f 19 | sed 's/-/\//g'`
DATE=`date "+%d/%m/%Y"`
TIME=`timedatectl status | grep Local | cut -d " " -f 20`

dunstify -r 102 -u low -t 1500 "Date: $DATE" "Time: $TIME"
sleep 1

#DATE=`timedatectl status | grep Local | cut -d " " -f 19 | sed 's/-/\//g'`
DATE=`date "+%d/%m/%Y"`
TIME=`timedatectl status | grep Local | cut -d " " -f 20`

dunstify -r 102 -u low -t 1000 "Date: $DATE" "Time: $TIME"
