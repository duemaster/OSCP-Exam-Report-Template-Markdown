#! /bin/bash
DOCKER_IMAGE_NAME="oscp-report-generator"
TEMPLATE_NAME="OSCP-exam-report-template_whoisflynn_v3.2.md"
OUTFILE_NAME="MY-REPORT"

# Use it need to rebuild all layers
# docker build -t $DOCKER_IMAGE_NAME . --no-cache

echo "Building Docker Image ${DOCKER_IMAGE_NAME}"
docker build -t $DOCKER_IMAGE_NAME . &> /dev/null

docker run --rm -v $PWD/generated-report:/report-generator/generated-report $DOCKER_IMAGE_NAME $TEMPLATE_NAME $OUTFILE_NAME