#!/bin/bash
battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
battery_state=`upower -i $(upower -e | grep BAT) | grep state | cut -d " " -f 20`

if [ -r "/home/atikin/.dbus/Xdbus" ]; then
	. "/home/atikin/.dbus/Xdbus"
fi

if [[ $battery_level -le 30 && $battery_level -gt 15 && $battery_state = "discharging" ]] ; then
	dunstify -u critical -t 5000 Battery "$battery_level% left!"

elif [[ $battery_level -le 15 && $battery_state = "discharging" ]] ; then
	dunstify -u critical -t 5000 Battery "$battery_level% left! Be careful, Nick!"
fi

#dunstify -u normal -t 5000 "System" "Service worked succesfully!"
