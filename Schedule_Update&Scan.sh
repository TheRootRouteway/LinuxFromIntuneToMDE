#!/bin/bash

# Delete the current user's crontab contents
crontab -r
# CRON job for running mdatp scan
CRON_JOB1="CRON_TZ=Europe/Paris\n0 11 * * Wed /bin/mdatp scan quick > ~/mdatp_cron_scan.log"

# CRON job to upgrade mdatp on Tuesdays before or on the 15th of the month
CRON_JOB2="0 11 * * Tue [ \$(date +\\%d) -le 15 ] && apt-get install --only-upgrade mdatp > ~/mdatp_cron_prod_update.log"
# CRON job to update definitions
CRON_JOB3="0 10 * * * /bin/mdatp definitions update > ~/mdatp_cron_def_update"

# Combine both CRON jobs
CRON_JOBS="$CRON_JOB1\n$CRON_JOB2\n$CRON_JOB3"

# Add the CRON jobs
# The `crontab -l` command lists the current crontab entries.
# `echo -e "$CRON_JOBS"` adds the new cron jobs with an echo command.
# The entire command sequence adds the new jobs to the crontab.
(crontab -l 2>/dev/null; echo -e "$CRON_JOBS") | crontab -

# Confirmation message
echo "Crontab entries added successfully."
