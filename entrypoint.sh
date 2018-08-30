#!/usr/bin/env sh

set +e

if [ -z ${CRON_SCHEDULE+x} ]; then
  ./curator
else
  CRON_SCHEDULE=${CRON_SCHEDULE}
  echo "${CRON_SCHEDULE} ./curator" > /etc/crontabs/root
  # Starting cron
  crond -f -d 0
fi
