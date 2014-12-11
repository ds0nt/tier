#!/bin/bash

source `dirname $0`/common.sh

cmd=$1
name=$2

usage="Usage: tier stop CONTAINER_NAME"

test_args 2 $@

case $cmd in
	"start" )
		echo "starting container \"$name\""
		tier exec docker start $name
		exit $?
		;;
	"stop" )
		echo "starting container \"$name\""
		tier exec docker stop $name
		exit $?
		;;
esac

echo $usage;
exit 1;