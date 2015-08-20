#!/bin/bash -e
VERSION=`cat VERSION`
TAG="edgarsnemse/ubuntu1204_nodejs_with_awsebcli:$VERSION"
echo "Building $TAG"
docker build --rm -t $TAG .
