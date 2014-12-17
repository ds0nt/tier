#!/bin/bash

scriptname=$1
scripts_dir=~/share/scripts

if [[ ! -f $scripts_dir/$1.sh ]]; then
	echo "$1.sh not found in $scripts_dir"
	echo -e "\n scripts available:"
	ls -l scripts_dir
fi


source ~/share/scripts/$1.sh