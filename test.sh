#!/bin/bash
CRITICAL=false
LOG=/tmp/


SERVICE="tcpdump"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "$SERVICE is running"
else
    echo "$SERVICE stopped"
CRITICAL=true  
fi
if [ $CRITICAL == true ]; then
/usr/bin/echo -n "Kindly provide the interface to run tcpdump example eth0 , press [ENTER]:"
read varname
/usr/bin/echo "running tcpdump on interface $varname"
tcpdump -i $varname >$LOG/$varname.`date +%d%m%Y`
fi
