#!/bin/sh
cd "$(dirname "$0")"
./sdhasher -p /mnt/2Tb/stable-diffusion-docker/stablediff-models -i /mnt/2Tb/stable-diffusion-docker/stablediff-web/cache.json -o cache.json -m 4
cp -f cache.json /mnt/2Tb/stable-diffusion-docker/stablediff-web/cache.json
./civitaimetadl /mnt/2Tb/stable-diffusion-docker/stablediff-models
