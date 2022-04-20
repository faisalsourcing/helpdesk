#!/bin/bash
#
# packager.io postinstall script
#

PATH=/opt/devsquest/bin:/opt/devsquest/vendor/bundle/bin:/sbin:/bin:/usr/sbin:/usr/bin:

# import config
. /opt/devsquest/contrib/packager.io/config

# import functions
. /opt/devsquest/contrib/packager.io/functions

# exec postinstall
debug

detect_os

detect_docker

detect_initcmd

detect_database

detect_webserver

create_initscripts

stop_devsquest

update_or_install

set_env_vars

start_devsquest

create_webserver_config

final_message
