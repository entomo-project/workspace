#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOCKER_MONGO_NEST_DEV_CONTAINER_NAME=mongo-nest-dev

DOCKER_MONGO_NEST_DEV_EXISTS=`docker inspect --format="{{ .Id }}" $DOCKER_MONGO_NEST_DEV_CONTAINER_NAME 2> /dev/null`

if ! [ -z "$DOCKER_MONGO_NEST_DEV_EXISTS" ]
then
  docker kill $DOCKER_MONGO_NEST_DEV_CONTAINER_NAME
  docker rm $DOCKER_MONGO_NEST_DEV_CONTAINER_NAME
fi

docker run \
    -d \
    --name mongo-nest-dev \
    mongo:3.2

docker run \
    -it \
    --link mongo-nest-dev:mongo-nest-dev \
    -v $DIR/../../../nest:/home/r/nest \
    roach-project/nest-dev \
    bash -c "su - r"
