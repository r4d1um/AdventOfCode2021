#!/usr/bin/env bash
IFS=$'\n\t'

######################################################################
# @file        : sonar_sweep_part1
# @created     : Wednesday Dec 01
#
# @description : Compare Prev with Next 
######################################################################

MYARRAY=()

while IFS= read -r line; do
   MYARRAY+=("$line")
done <./dataset.txt

COUNTER=0

for (( i = 0; i < ${#MYARRAY[@]}; i++ )); do
	if [ "$i" -eq ${#MYARRAY[@]} ]; then
		break
	else
		prev=${MYARRAY[i]}
		next=${MYARRAY[i+1]}
		if [[ $next -gt $prev ]]; then
			COUNTER=$((COUNTER+1))	
		fi
	fi
done

echo $COUNTER
