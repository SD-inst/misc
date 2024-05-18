#!/bin/sh
if [ "$1" = "connect" ]
then
  docker network connect stable-diffusion-docker_internet stablediff-runner-cuda
else
  docker network disconnect stable-diffusion-docker_internet stablediff-runner-cuda
fi
