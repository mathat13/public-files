#!/bin/bash

#log_dir=/tmp/cron_logs/$(date +'%Y%m%d')
#mkdir -p "$log_dir" || { echo "Can't create log directory '$log_dir'"; exit 1; }

#
# we write to the same log each time
# this can be enhanced as per needs: one log per execution, one log per job per execution etc.
#
# log_file=$log_dir/cron.log

#
# hitherto, both stdout and stderr end up in the log file
#
#exec 2>&1 1>>"$log_file"

#
# Run the environment setup that is shared across all jobs.
# This can set up things like PATH etc. 
#
# Note: it is not a good practice to source in .profile or .bashrc here
#
source "$HOME/.local/bin/cron_env_setup"

#
# run the job
#
# echo "$(date): starting cron, command=[$*]"
"$@"
# echo "$(date): cron ended, exit code is $?"
