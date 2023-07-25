#!/bin/bash -v

HOST_VOL=/home/caoy/deceval/data
DOCKER_VOL=/root/data
NAME=jycm
IMAGE=ubuntu
VERSION=latest

VMACHINE=podman

$VMACHINE run -itd \
	   --security-opt=label=disable \
	   -v ${HOST_VOL}:${DOCKER_VOL} \
	   -p 8000:8000 \
	   --net=bridge \
	   --name $NAME ${IMAGE}:${VERSION} /bin/bash
