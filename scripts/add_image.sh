#!/bin/bash

NAME=${1}
TAG=${2}

DIR=../dockerfiles/${NAME}


cd $DIR || { echo 'Dockerfile not found at' ${DIR}; exit 1; }

docker build --tag=${TAG} ./