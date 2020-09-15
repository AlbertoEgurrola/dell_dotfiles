#!/bin/bash

#display_name="eDP1"
#brightness=$(xrandr --verbose | grep -A 20 $display_name | grep 'Backlight:' | awk '{ print $2 }')
brightness=$(light -G | awk -F. '{ print $1 }')
brightness=$(echo $brightness | tr -d '\n')
echo "<fn=4></fn> $brightness%"

