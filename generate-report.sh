#! /bin/bash
DOCKER_IMAGE_NAME="oscp-report-generator"

# Use it need to rebuild all layers
# docker build -t $DOCKER_IMAGE_NAME . --no-cache

docker build -t $DOCKER_IMAGE_NAME .

docker run -v $PWD/generated-report:/report-generator/generated-report -it $DOCKER_IMAGE_NAME bash