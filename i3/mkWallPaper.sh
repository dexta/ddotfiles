#!/usr/bin/sh

a=""
x=5
y=5
sx=2560
sy=1024

for b in $(ls *.png);
  do
    rxy=$(identify $b | awk {'print $3'});
    rx=$(echo $rxy | cut -d "x" -f1)
    ry=$(echo $rxy | cut -d "x" -f2)
    #echo $rx,$ry
    if [ $rx -gt 900 ]; then
	 continue;
    fi
    a="$a -page +$x+$y $b";
    
    if [ $x -gt $sx ] 
    then 
	if [ $y -gt $sy ]
	  then
		break;
	fi
	x=5    
   	y=$(($y+$ry));
    else
	x=$(($x+$rx))
    fi
    
echo $x,$y,"  ",$rx,$ry
  done;
echo "convert -size 2560x1024 xc:black $a -layers flatten collage.png"

