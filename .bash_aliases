#!/bin/bash

countdownfn () { 
	MIN=$1; 
	for ((i=$((MIN*60));i>=0;i--));
	do 
		echo -ne "\r$(date -d"0+$i sec" +%H:%M:%S)";
		sleep 1;
	done; 
}

alias countdown=countdownfn
