#!/bin/bash

source `dirname $0`/common.sh

image=$1
name=$2
arglength=2

usage="Usage: tier run IMAGE CONTAINER_NAME"

test_args 2 $@

if [[ ! $name ]]; then
	name=$image
fi

echo "starting image \"$image\" with name \"$name\""

tier exec docker run -d -t -p 2735:80 -v /home/core:/home:ro --name=$name $image