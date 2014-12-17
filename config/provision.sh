#!/bin/bash

echo 'running provision.sh'

home=~

# make a global command called "tier"
# /usr/bin/tier -> ~/share/tier.sh 
if [[ -f $home/share/tier.sh ]]; then
	ln -s tier.sh /usr/bin/tier
	chmod +x tier.sh
fi