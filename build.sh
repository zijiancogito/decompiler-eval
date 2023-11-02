#!/bin/bash -v

HOST_DATA=/data/caoy/eval/dsmith
DOCKER_DATA=/root/data/dsmith
HOST_SRC=/home/caoy/decompiler-eval/decompiler-eval
DOCKER_SRC=/root/decompiler-eval
HOST_DEC=/home/caoy/decompiler-eval/decompiler
DOCKER_DEC=/root/decompiler
NAME=eval-semantic
IMAGE=localhost/semantic
VERSION=latest

VMACHINE=podman

${VMACHINE} run -itd \
           --security-opt=label=disable \
           -v ${HOST_DATA}:${DOCKER_DATA} \
	   -v ${HOST_SRC}:${DOCKER_SRC} \
	   -v ${HOST_DEC}:${DOCKER_DEC} \
	   --ipc=host \
           --net=bridge \
           --name $NAME ${IMAGE}:${VERSION} /bin/bash

