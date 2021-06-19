#!/bin/bash
LAYOUT=`xkblayout`


if [ $LAYOUT = "Eng" ] ; then
	setxkbmap -model abnt2 -layout br -variant abnt2
	dunstify -r 101 -u low -t 1500 "Keyboard" "PT-BR"
elif [ $LAYOUT = "Por" ] ; then
	setxkbmap -model abnt2 -layout us
	dunstify -r 101 -u low -t 1500 "Keyboard" "EN-US"
fi

