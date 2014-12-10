#!/bin/bash

base_dir=..
share_dir=share
share_dir_remote=/home/core/share

save_path=${share_dir}/image.tar
load_path=${share_dir_remote}/image.tar

cd $base_dir

if ! (docker save $1 > $save_path); then
	echo 'Failed to save docker'
	exit 1
fi

if vagrant ssh --command "docker load -i ${load_path}"; then
	echo "Docker Loaded"
	rm $save_path
else
	echo "Docker image failed to load"	
fi
