#!/usr/bin/env bash
IFS=$'\n\t'

######################################################################
# @file        : sonar_sweep_part2
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
		one_one=${MYARRAY[i]}
		one_two=${MYARRAY[i+1]}
		one_three=${MYARRAY[i+2]}
		
		two_one=${MYARRAY[i+1]}
		two_two=${MYARRAY[i+2]}
		two_three=${MYARRAY[i+3]}
	
		sum_one=$((one_one+one_two+one_three))
		sum_two=$((two_one+two_two+two_three))

		if [[ $sum_two -gt $sum_one ]]; then
			COUNTER=$((COUNTER+1))	
		fi
	fi
done

echo $COUNTER
