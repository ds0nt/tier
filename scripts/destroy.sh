#!/bin/bash

source `dirname $0`/common.sh

subcommand=$1

usage="Usage: tier destroy [vagrant|tier|all]"

test_args 1 $@

rm_vagrant () {
	echo 'Tier is destroying the coreos instance'

	if ! local_vagrant destroy -f ; then
		echo "vagrant destroy failed. was the machine running?"	
		confirm "proceed?" || exit 0;
	fi
}

rm_tier () {
	echo "Removing $TIER folder"

	rm -rf $TIER
}

rm_all () {
	echo "removing contents of $(pwd)"

	rm -rf *
}

case $subcommand in
  "vagrant")
	confirm "destroy vagrant machine?" && rm_vagrant
    ;;
  "tier")
	confirm "destroy vagrant machine and rm $TIER?" && rm_vagrant && rm_tier
    ;;
  "all")
	confirm "destroy vagrant machine, and delete contents of $(pwd)?" && rm_vagrant && rm_tier && rm_all
    ;;
esac