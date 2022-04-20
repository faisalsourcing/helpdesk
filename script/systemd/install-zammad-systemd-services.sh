#!/bin/bash
#
# enable devsquest systemd services
#

devsquest_ENV_DIR="/etc/devsquest"
SYSTEMD_SERVICE_DIR="/etc/systemd/system"

if [ "$(whoami)" != 'root' ]; then
  echo "you need to be root to run this script!"
  exit 1
fi

test -d ${devsquest_ENV_DIR} || mkdir -p ${devsquest_ENV_DIR}

test -d ${SYSTEMD_SERVICE_DIR} || mkdir -p ${SYSTEMD_SERVICE_DIR}

cp devsquest.env ${devsquest_ENV_DIR}

cp devsquest.service devsquest-rails.service devsquest-scheduler.service devsquest-websocket.service ${SYSTEMD_SERVICE_DIR}

systemctl daemon-reload

systemctl enable devsquest

systemctl start devsquest
