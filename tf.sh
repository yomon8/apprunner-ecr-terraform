#!/bin/bash
HOME_DIR=$(cd $(dirname $0); pwd)
TF_DIR=${HOME_DIR}
cd ${HOME_DIR}

BUILD_IMAGE=apprunner-ecr-terraform-builder

DOCKER_BUILDKIT=1 docker build -t ${BUILD_IMAGE} .

docker run -it --rm \
    -v ${HOME}/.aws:/root/.aws:ro \
    -v ${TF_DIR}:/work \
    -w /work \
    -v /var/run/docker.sock:/var/run/docker.sock \
    ${BUILD_IMAGE} $*