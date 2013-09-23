#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
        read line
	cpu=$(python /home/kenny/.i3/myStatus.py | tr "\\n" " | ")
        echo "$cpu || $line" || exit 1
done
