#!/bin/bash

set -o errexit
set -o pipefail

docker build --no-cache -t devsquest/smime-test-certificates:latest .

docker run --rm -v "$(pwd)/../:/etc/ssl/certs" devsquest/smime-test-certificates:latest
