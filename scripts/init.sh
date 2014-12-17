#!/bin/bash

vagrant=/usr/bin/vagrant
virtualbox=/usr/bin/virtualbox

TIERDIR=/usr/lib/tier
CONFDIR=.tier
VAGRANTDIR=vagrant

LOCAL_SHARE=share
LOCAL_VM=vm

[ "$1" = "-v" ] && VERBOSE=1

if [ $VERBOSE ] ; then
	shift;
	mkdir () { command mkdir --verbose "$@"; }
	cp () { command cp --verbose "$@"; }	
fi

verbose () {
	if $VERBOSE; then
		echo "$@"
	fi
}

# tier project initalize location
if [[ ! $# -eq 0 ]]; then
	DIR=$1
else
	DIR=$(pwd)
fi


# create target project dir if doesnt exist
if [ ! -d $DIR ]; then
	mkdir -p $DIR
	if [ ! $? -eq 0 ]; then
		echo "ERROR: Failed to create directory" $DIR
		exit 1;
	fi
fi

cd $DIR

if [[ -d $CONFDIR ]]; then
	echo "ERROR: There is already a tier project initialized in \"$(pwd)\""
	exit 1;
fi

# Create .tier directory
mkdir $CONFDIR
if [ ! $? -eq 0 ]; then
	echo "ERROR: Failed to create directory" $CONFDIR
	exit 1;
fi


cd $CONFDIR

echo "Initializing project in $DIR"

which $vagrant > /dev/null || { echo 'vagrant not found'; exit 1; }
which $virtualbox > /dev/null || { echo 'virtualbox not found'; exit 1; }

echo "Cloning CoreOS Official Vagrant Repository \"coreos/coreos-vagrant.git\""

git clone $( [ $VERBOSE ] || echo "-q" ) https://github.com/coreos/coreos-vagrant.git $VAGRANTDIR || exit 1;

mkdir $DIR/$LOCAL_VM
cp $TIERDIR/config/* $DIR/$LOCAL_VM

# vm shared folder
mkdir $DIR/$LOCAL_SHARE

echo "tier project initialized"