#!/bin/bash
file_a=qunmember2013.11.27.txt
file_b=mxddb2013.11.27.txt
member_a=`cat $file_a |awk '{print $1}'`
member_b=`cat $file_b |awk '{print $2}'`
#echo $member_a;
#echo $member_b;
for i in $member_a
do
	flag=0;
	for j in $member_b
	do
		if [ "$i" == "$j" ];
		then
#			echo $j
			flag=1;
			break;
		fi
	done
	if [ $flag -eq 0 ];
	then
#		echo $i;
		tmp+=" $i";
	fi
#	echo $i;
done
#echo $tmp;
for k in $tmp
do
	cat $file_a | awk -v n=$k '{if($1==n) print $0}'
#	echo $k;
done
