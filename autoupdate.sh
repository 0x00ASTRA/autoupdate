#!/bin/bash

LAST_EXECUTION_FILE=~/autoupdate/log/autoupdate_last_exec.log
LOG_FILE=~/autoupdate/log/autoupdate.log
ERROR_LOG_FILE=~/autoupdate/log/autoupdate_error.log

current_date=$(date +%s)

if [ -e $LAST_EXECUTION_FILE ]; then
    last_execution_date=$(cat $LAST_EXECUTION_FILE)
else
    last_execution_date=0
fi

time_since_last_execution=$((current_date-last_execution_date))

if [ $time_since_last_execution -ge 604800 ]; then
    echo "Updating System Packages..."

    echo $(date) >> $LOG_FILE
    echo "Updating System Packages..." >> $LOG_FILE
    sudo apt-get -y update && sudo apt -y upgrade 2> $ERROR_LOG_FILE

    if [ $? -eq 0 ]; then
        echo $current_date > $LAST_EXECUTION_FILE
        echo "Update Complete"

        echo $(date) >> $LOG_FILE
        echo "Update Complete" >> $LOG_FILE
    else
        echo "Error: There were errors during the system update"
        echo "Error Log:"
        cat $ERROR_LOG_FILE

        echo $(date) >> $LOG_FILE
        echo "ERROR:" >> $LOG_FILE
        cat $ERROR_LOG_FILE >> $LOG_FILE
    fi
fi

