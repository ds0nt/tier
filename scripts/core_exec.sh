#!/bin/bash

source `dirname $0`/common.sh

cd $LOCAL_VAGRANT
 
echo $@ | vagrant ssh -- /bin/bash