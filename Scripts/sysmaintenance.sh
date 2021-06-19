#!/bin/bash

#CMND=`echo -e "Exit\nReboot\nShutdown" | dmenu -fn "Mono-9" -nb "#222222" -nf "#676e7d" -sb "#222222" -sf "#dfdfdf" -p "What do you want to do?"`
CMND=`echo -e "Exit\nSwitch(Intel)\nSwitch(Hybrid)\nSwitch(NVIDIA)\nReboot\nShutdown" | rofi -dmenu -font "DejaVu Sans Mono 10" -p "What do you want to do?"`

if [ $CMND = "Exit" ] ; then
	EXIT=`echo -e "No\nYes" | rofi -dmenu -font "DejaVu Sans Mono 10" -p "Exit i3 session?"`
	if [ $EXIT = "Yes" ] ; then
		i3-msg exit
        #CURRENT=`optimus-manager --print-mode`
        #optimus-manager --switch $CURRENT --no-confirm
	fi
elif [ $CMND = "Reboot" ] ; then
	REBOOT=`echo -e "No\nYes" | rofi -dmenu -font "DejaVu Sans Mono 10" -p "Reboot system?"`
	if [ $REBOOT = "Yes" ] ; then
		reboot
	fi
elif [ $CMND = "Shutdown" ] ; then
	SHUTDOWN=`echo -e "No\nYes" | rofi -dmenu -font "DejaVu Sans Mono 10" -p "Shutdown system?"`
	if [ $SHUTDOWN = "Yes" ] ; then
		shutdown -P now
	fi
elif [ $CMND = "Switch(Intel)" ] ; then
	INTEL=`echo -e "No\nYes\nBoot(Option)" | rofi -dmenu -font "DejaVu Sans Mono 10" -p "Switch to Intel?"`
	CURRENT=`optimus-manager --print-mode | grep GPU | cut -d " " -f 5`
	if [ $INTEL = "Yes" ] ; then
		if [ $CURRENT = "intel" ] ; then
			dunstify -u critical -t 3000 "System" "The current GPU is already $CURRENT"
        else
            optimus-manager --switch intel --no-confirm
		fi
	elif [ $INTEL = "Boot(Option)" ] ; then
		optimus-manager --set-startup intel --no-confirm
		dunstify -u critical -t 2000 "System" "Boot option set to intel"
		
	fi
elif [ $CMND = "Switch(NVIDIA)" ] ; then
	NVIDIA=`echo -e "No\nYes\nBoot(Option)" | rofi -dmenu -font "DejaVu Sans Mono 10" -p "Switch to NVIDIA?"`
	CURRENT=`optimus-manager --print-mode | grep GPU | cut -d " " -f 5`
	if [ $NVIDIA = "Yes" ] ; then
		if [ $CURRENT = "nvidia" ] ; then
			dunstify -u critical -t 3000 "System" "The current GPU is already $CURRENT"
        else
            optimus-manager --switch nvidia --no-confirm
		fi
	elif [ $NVIDIA = "Boot(Option)" ] ; then
		optimus-manager --set-startup nvidia --no-confirm
		dunstify -u critical -t 2000 "System" "Boot option set to nvidia"
	fi
elif [ $CMND = "Switch(Hybrid)" ] ; then
    HYBRID=`echo -e "No\nYes\nBoot(Option)" | rofi -dmenu -font "DejaVu Sans Mono 10" -p "Switch to Hybrid mode?"`
    CURRENT=`optimus-manager --print-mode | grep GPU | cut -d " " -f 5`
    if [ $HYBRID = "Yes" ] ; then
        if [ $CURRENT = "hybrid" ] ; then
            dunstify -u critical -t 3000 "System" "The current GPU is already $CURRENT"
        else
            optimus-manager --switch hybrid --no-confirm
            i3-msg exit
        fi
    elif [ $HYBRID = "Boot(Option)" ] ; then
        optimus-manager --set-startup hybrid --no-confirm
        dunstify -u critical -t 2000 "System" "Boot option set to hybrid"
    fi
fi
