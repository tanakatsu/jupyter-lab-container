#!/bin/bash

docker rm $(docker ps -q -q)
docker rmi $(docker images -f "dangling=true" -q)
