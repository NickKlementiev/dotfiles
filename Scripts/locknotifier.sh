if [ -r "$HOME/.dbus/Xdbus" ]; then
	. "$HOME/.dbus/Xdbus"
fi

COUNTER=5

while [ $COUNTER -gt 1 ] 
do
    dunstify -r 110 -u critical -t 1000 Screenlock "Locking in $COUNTER seconds"
    sleep 1
    COUNTER=$(($COUNTER - 1))
done

dunstify -r 110 -u critical -t 1000 Screenlock "Locking in $COUNTER seconds"
