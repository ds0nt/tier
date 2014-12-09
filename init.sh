#!/bin/bash

vagrant=/usr/bin/vagrant
virtualbox=/usr/bin/virtualbox


which $vagrant > /dev/null || { echo 'vagrant not found'; exit 1; }
which $virtualbox > /dev/null || { echo 'virtualbox not found'; exit 1; }

git clone https://github.com/coreos/coreos-vagrant.git $1 || exit 1;

cp -vf config/* $1

cd $1
mkdir share

vagrant up || exit 1;

vagrant ssh core-01 -- -A || exit 1;