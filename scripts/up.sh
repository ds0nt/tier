#!/bin/bash

vagrant=/usr/bin/vagrant
virtualbox=/usr/bin/virtualbox

VAGRANTCONFDIR=vm
VAGRANTDIR=.tier/vagrant
TIER=.tier

if [[ ! -d $TIER ]]; then
	echo "tier project is not initialized";
	exit 1;
fi

[ "$1" = "-v" ] && { VERBOSE=1; shift; }

if [[ $VERBOSE ]]; then
	cp () { command cp --verbose "$@"; }		
fi

verbose () {
	if $VERBOSE; then
		echo "$@"
	fi
}

cp -f $VAGRANTCONFDIR/* $VAGRANTDIR

cd $VAGRANTDIR
 
echo 'Tier is booting coreos instance'

vagrant up || exit 1;

vagrant ssh core-01 -- -A || exit 1;
