#!/bin/sh
# This will print out the unicode range provided
rangestart=$1
rangeend=$2

unicodeoutput=$(
echo " :0:1:2:3:4:5:6:7:8:9:A:B:C:D:E:F"
for x in $(seq $rangestart $rangeend); do
	printf "U+%sx:" $x
	for y in $(seq 0 15 | xargs printf '%x\n'); do
		echo -n "\\u${x}${y}:"
	done
	echo ""
done
)

echo $unicodeoutput | column -ts ":"