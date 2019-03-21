#!/bin/ash

set -e
printf "============= env ==================="

printenv
printf "\n======= end ========="

printf "\n============= /etc/mosquitto.conf ==================="

cat /etc/mosquitto.conf

printf "\n======= end ========="

# the following address Group ID issues and permissions
# container user is mosquitto
chmod -R o+w /mosquitto/data
chmod -R o+w /mosquitto/log

exec "$@"
