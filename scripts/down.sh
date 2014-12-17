#!/bin/bash

source `dirname $0`/common.sh

usage="Usage: tier down"

echo 'Tier is shutting down the coreos instance'

if ! local_vagrant halt; then
	echo "vagrant halt failed. was the machine running?"	
fi

local_vagrant status;