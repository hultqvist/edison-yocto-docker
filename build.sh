#!/bin/bash

#Abort on first error
set -e

cd $(dirname $0)

#remove all stopped docker sessions
docker rm -v $(docker ps -a -q -f status=exited)

#Remove dangling images
docker rmi $(docker images -f "dangling=true" -q)


#Ubuntu with general packages for building
docker build --tag edison/ubuntu-build ubuntu-build

#Prepare the build user account
docker build --tag edison/user edison-user

#The Edison source code
docker build --tag edison/source edison-source

# Prepare the build and prefetch sources
docker build --tag edison/download edison-download

# Build the edison image
docker build --tag edison/image edison-image

echo ""
echo "docker cp CONTAINERID:/home/edison/toFlash.zip ."
echo ""
echo "All done"
echo ""

