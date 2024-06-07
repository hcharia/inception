#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then
    HOME_DIR="/home/${SUDO_USER}"
else
    HOME_DIR="/home/${USER}"
fi

[ ! -d "${HOME_DIR}/data" ] && mkdir "${HOME_DIR}/data" && chmod 777 "${HOME_DIR}/data"
[ ! -d "${HOME_DIR}/data/db" ] && mkdir "${HOME_DIR}/data/db" && chmod 777 "${HOME_DIR}/data/db"
[ ! -d "${HOME_DIR}/data/wpdb" ] && mkdir "${HOME_DIR}/data/wpdb" && chmod 777 "${HOME_DIR}/data/wpdb"
exit 0