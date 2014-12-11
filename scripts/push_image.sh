#!/bin/bash

share_dir=share
share_dir_remote=/home/core/share

save_path=${share_dir}/image.tar
load_path=${share_dir_remote}/image.tar

vagrant_path=.tier/vagrant

image=$1

TIER=.tier


if [[ ! -d $TIER ]]; then
	echo "tier project is not initialized";
	exit 1;
fi

echo "pushing $image to CoreOS instance"

docker save $image > $save_path

if [ ! $? -eq 0 ]; then
	echo 'failed to save the local docker image'
	exit 1
fi

cd $vagrant_path

vagrant ssh -- /bin/bash << EOF
	docker load -i $load_path
	if [ \$? -eq 0 ]; then
		echo "image pushed";
	else
		echo "failed to load the image on CoreOS";
	fi
	rm $load_path
EOF