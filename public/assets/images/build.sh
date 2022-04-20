#!/bin/bash

set -o errexit
set -o pipefail

docker build --no-cache -t devsquest/svg-icons-build:latest .

docker run --rm -v "$(pwd)/:/tmp/gulp" devsquest/svg-icons-build:latest
