#!/bin/bash

TIER=.tier
TIER_LIB=/usr/lib/tier
TIER_SCRIPTS=${TIER_LIB}/scripts

LOCAL_VAGRANT=.tier/vagrant

# Verbose
if [[ ! -d $TIER ]]; then
	echo "tier project is not initialized";
	exit 1;
fi

[ "$1" = "-v" ] && { VERBOSE=1; shift; }

# tier project initalize location
test_args () {
	if [ $1 -ge ${#@} ]; then
		echo $usage;
		exit 1;
	else
		return 1;
	fi
}