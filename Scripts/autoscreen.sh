#!/bin/bash
STATUS=`xset q | cut -d " " -f5 | grep Enabled`

if [ "$STATUS" = "Enabled" ] ; then
	xset s off -dpms
	#killall -s STOP xautolock
	dunstify -r 100 -u low -t 1500 "Screenlock" "Off"
else
	xset s 300 +dpms
	#killall -s CONT xautolock
	dunstify -r 100 -u low -t 1500 "Screenlock" "On"
fi
