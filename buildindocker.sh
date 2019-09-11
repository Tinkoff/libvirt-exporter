#!/bin/bash

set -x

REPO_URL="github.com/AlexZzz/libvirt-exporter"
BINARY_NAME=libvirt-exporter

docker build -t libvirtexporterbuild -f Dockerbuildimage .
docker run --rm \
  -v "$PWD"/../go/src:/go/src -w /go/src \
  -v "$PWD":/go/src/${REPO_URL} -w /go/src/${REPO_URL} \
  -e GOOS=linux \
  -e GOARCH=amd64 \
   libvirtexporterbuild:latest go build --ldflags '-extldflags "-static"' -o ${BINARY_NAME}

strip ${BINARY_NAME}
upx ${BINARY_NAME}

