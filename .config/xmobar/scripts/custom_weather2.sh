#!/bin/bash
output=$(curl "wttr.in/Caborca?format=3")
#echo $output | awk '{ if ($0 ~ /Caborca/){ print "<fn=5>" $2 "</fn> " $3} else{ print "Weather..."}}'
echo $output | awk '{ if ($0 ~ /Caborca/){ print "<fn=5>" $2 "</fn> " $3} else{ print "Weather..."}}'
