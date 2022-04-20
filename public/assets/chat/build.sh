#!/bin/bash

set -o errexit
set -o pipefail

docker build --no-cache -t devsquest/chat-build:latest .

docker run --rm -v "$(pwd)/:/tmp/gulp" devsquest/chat-build:latest
