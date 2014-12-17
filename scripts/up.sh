#!/bin/bash

source `dirname $0`/common.sh

usage="Usage: tier up"

cp -f $LOCAL_VM_CONF/* $LOCAL_VAGRANT

 
echo 'Tier is booting coreos instance'

local_vagrant up || exit 1;

local_vagrant ssh -- -A || exit 1;