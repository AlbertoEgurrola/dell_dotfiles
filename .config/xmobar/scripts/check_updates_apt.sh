#!/bin/bash
#sudo apt update | tail -n1 | awk {'{if( $0 ~ /([[:digit:]]+) packages can be upgraded/) print $1 " updates"; else print "Up-to-date"}'} | tail -n1
UPDATE=$(sudo apt update | tail -n1 | awk {'{if( $0 ~ /([[:digit:]]+) packages can be upgraded/) print "<fn=4>\uf0f3</fn>  " $1; else print "<fn=4>\uf00c</fn>"}'} | tail -n1)

echo -e $UPDATE
