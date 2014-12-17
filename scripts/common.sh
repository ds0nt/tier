#!/bin/bash

TIER=.tier
TIER_LIB=/usr/lib/tier
TIER_SCRIPTS=${TIER_LIB}/scripts

LOCAL_VAGRANT=.tier/vagrant
LOCAL_VM_CONF=vm

# Verbose
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

# tier project initalize location
test_args () {
	if [ $1 -ge ${#@} ]; then
		echo $usage;
		exit 1;
	else
		return 1;
	fi
}

local_vagrant () {
	cd $LOCAL_VAGRANT
	command vagrant $@
	result=$?
	cd - > /dev/null
	return $result
}

confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}