#! /bin/bash
DOCKER_IMAGE_NAME="oscp-report-generator"

# Use it need to rebuild all layers
# docker build -t $DOCKER_IMAGE_NAME . --no-cache

docker build --build-arg current_user=${LOGNAME} -t $DOCKER_IMAGE_NAME .

docker run --rm -v $PWD/generated-report:/report-generator/generated-report $DOCKER_IMAGE_NAME