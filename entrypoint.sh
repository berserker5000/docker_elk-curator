#!/usr/bin/env sh

set +e

if [ -z ${CRON_SCHEDULE+x} ]; then
  /usr/local/bin/curator/curator.sh
else
  CRON_SCHEDULE=${CRON_SCHEDULE}
  echo "${CRON_SCHEDULE} /usr/local/bin/curator/curator.sh" > /etc/crontabs/root
  # Starting cron
  crond -f -d 0
fi
