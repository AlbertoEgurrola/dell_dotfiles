#!/bin/bash

VOLUME=$(pacmd list-sinks|grep -A 15 '* index:'| awk '{ if ($0 ~ /muted: yes/){ print ":M"}else if($0 ~ /volume: front/){ print $5 }}' | tr '\n' ':' | sed 's/[%|,]//g' | awk -F: '{ print ($0 ~ /M/ ? "-1" : $1) }')
#DEVICE=$(pacmd list-sinks|grep -A 15 '* index: ' | awk '{ if ($0 ~ /name: .+\.hdmi-stereo/){print "HDMI"}else if($0 ~ /name: .+\.usb-Kingston/){print "Headphones"}else if($0 ~ /name: .+\.pci.+\.analog-stereo/){print "Built-in"}}')
DEVICE=$(pacmd list-sinks|grep -A 100 '* index: ' | awk '{ if ($0 ~ /active port: <analog-output-headphones/){print "Headphones"}else if($0 ~ /active port: <analog-output-speaker>/){print "Speakers"}}')
#ICON=$(pacmd list-sinks|grep -A 15 '* index: ' | awk '{ if ($0 ~ /name: .+\.hdmi-stereo/){print "\uf108"}else if($0 ~ /name: .+\.usb-Kingston/){print "\uf025"}else if($0 ~ /name: .+\.pci.+\.analog-stereo/){print "\uf109"}}')
ICON=""
if [ $DEVICE == "Speakers" ]
then
    if [ $VOLUME -lt 0 ]; then
        ICON="\uf6a9"
    elif [ $VOLUME -eq 0 ]; then
        ICON="\uf026"
    elif [ $VOLUME -le 40 ]; then
        ICON="\uf027"
    else
        ICON="\uf028"
    fi
elif [ $DEVICE == "Headphones" ]; then
    ICON="\uf025"
fi

if [ $VOLUME -lt 0 ]
then
    VOLUME='Mute'
else
    VOLUME="$VOLUME%"
fi

echo -e "<fn=4>$ICON</fn> $VOLUME"
