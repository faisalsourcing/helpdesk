#!/usr/bin/env bash
#
# devsquest restore script
#

# shellcheck disable=SC2046
BACKUP_SCRIPT_PATH="$(dirname $(realpath $0))"

# import functions
. ${BACKUP_SCRIPT_PATH}/functions

# ensure we have all options
demand_backup_conf

# exec restore
start_restore_message

get_devsquest_dir

restore_warning "${1}"

check_database_config_exists

check_empty_password

get_restore_dates

choose_restore_date "${1}"

backup_file_read_test

detect_initcmd

stop_devsquest

restore_devsquest

start_devsquest

finished_restore_message
