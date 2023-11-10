#!/bin/bash 

ID=$(docker create matrix42-shim)
docker cp $ID:/build/build.log build.log-docker
docker rm -v $ID

