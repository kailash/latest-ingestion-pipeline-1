#!/bin/bash

MAJOR_RELEASE=4
MINOR_RELEASE=5
PATCH_RELEASE=alpha
COMMIT_ID=`git log -1 --pretty=%h` # last commit-id in short form

# To be executed from project root
docker build -t ghcr.io/datakaveri/lip-depl:$MAJOR_RELEASE.$MINOR_RELEASE.$PATCH_RELEASE-$COMMIT_ID -f docker/depl.dockerfile . && \
docker push ghcr.io/datakaveri/lip-depl:$MAJOR_RELEASE.$MINOR_RELEASE.$PATCH_RELEASE-$COMMIT_ID

docker build -t ghcr.io/datakaveri/lip-dev:$MAJOR_RELEASE.$MINOR_RELEASE.$PATCH_RELEASE-$COMMIT_ID -f docker/dev.dockerfile . && \
docker push ghcr.io/datakaveri/lip-dev:$MAJOR_RELEASE.$MINOR_RELEASE.$PATCH_RELEASE-$COMMIT_ID
