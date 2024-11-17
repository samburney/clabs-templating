#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOCKERFILES=$( find "${SCRIPT_DIR}" -type f -name '*.Dockerfile' -exec basename {} \; )

for DOCKERFILE in ${DOCKERFILES} ; do
    TAGNAME=$(echo ${DOCKERFILE} | sed -E 's/^(.*)\.Dockerfile/\1/i')

    docker build -t "local/${TAGNAME}:latest" -f "${SCRIPT_DIR}/${DOCKERFILE}" "${SCRIPT_DIR}"
done
