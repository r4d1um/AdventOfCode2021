#!/usr/bin/env bash
IFS=$'\n\t'

######################################################################
# @file        : dive_part2 
# @created     : Thursday Dec 02, 2021 
#
# @description : Compare Prev with Next 
######################################################################

while IFS= read -r line; do
   LOCATIONS+=("$line")
done <./dataset.txt

HORIZONTAL=0
DEPTH=0
MOVEMENT=0
AIM=0
TEMP=0

for (( i = 0; i < ${#LOCATIONS[@]}; i++ )); do
	LOCATION=()
	IFS=' ' read -ra LOCATION <<< "${LOCATIONS[$i]}"
	if [[ ${LOCATION[0]} == "forward" ]]; then
		MOVEMENT=${LOCATION[1]}
		TEMP=$((AIM*MOVEMENT))
		DEPTH=$((DEPTH+TEMP))
		HORIZONTAL=$((HORIZONTAL+MOVEMENT)) 
		TEMP=0
		MOVEMENT=0
	fi	
	if [[ ${LOCATION[0]} == "up" ]]; then
		MOVEMENT=${LOCATION[1]}
		AIM=$((AIM-MOVEMENT))
		MOVEMENT=0
	fi	
	if [[ ${LOCATION[0]} == "down" ]]; then
		MOVEMENT=${LOCATION[1]}
		AIM=$((AIM+MOVEMENT))
		MOVEMENT=0
	fi
done

echo $HORIZONTAL
echo $DEPTH

echo $((HORIZONTAL*DEPTH))
