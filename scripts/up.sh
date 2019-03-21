#!/bin/bash

SCRIPT_PATH=$(dirname $(realpath $0))
DOCKER_PATH=$(dirname $SCRIPT_PATH)

echo "=================================="
echo "== docker-compose up -d $@ "
echo "=================================="
(cd $DOCKER_PATH; docker-compose up -d $@)