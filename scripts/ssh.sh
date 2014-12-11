#!/bin/bash

source `dirname $0`/common.sh

name=$1

if [[ $name ]]; then
	cd $LOCAL_VAGRANT
	vagrant ssh --command "docker exec -it $name bash"
else
	cd $LOCAL_VAGRANT
	vagrant ssh	
fi