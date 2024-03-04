#!/bin/bash 

ID=$(docker create matrix42-shim)
docker cp $ID:/build/shim-15.8/shimx64.efi shimx64.efi-docker
docker rm -v $ID

