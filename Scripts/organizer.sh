#!/bin/bash
CURRENT=`i3-msg -t get_workspaces | jq '.[] | select(.focused).name' | cut -f 2 -d "\""`
ARRAY=( I II III IV V VI VII VIII IX X )

for i in "${ARRAY[@]}"
do
	i3-msg workspace $i
	i3-msg rename workspace to $i
done
echo $CURRENT
i3-msg workspace $CURRENT
dunstify -r 103 -u low -t 1500 "System" "Workspaces reorganized"
