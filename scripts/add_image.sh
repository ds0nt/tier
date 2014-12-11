#!/bin/bash

NAME=${1}
TAG=${2}

DIR=../dockerfiles/${NAME}

if [ ! -f DIR ]; then
	echo 'Dockerfile not found at' ${DIR};
	exit 1; 
fi

cd $DIR

docker build --tag=${TAG} ./