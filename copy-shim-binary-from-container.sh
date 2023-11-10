#!/bin/bash 

ID=$(docker create matrix42-shim)
docker cp $ID:/build/shim-15.7/shimx64.efi shimx64.efi-docker
docker rm -v $ID

