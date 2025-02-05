#!/bin/sh

# State time and date
echo -e "\nDaily crontab backup for `date`"

# cd to public directory
cd /shares/dfsroot/codeshare

# Add and commit changes
/usr/bin/git add --all
/usr/bin/git commit -m "daily crontab backup `date`"

# send data to Git server
/usr/bin/git push origin main

# cd to private directory
cd /shares/dfsroot/synced_files

# Add and commit changes
/usr/bin/git add --all
/usr/bin/git commit -m "daily crontab backup `date`"

# send data to Git server
/usr/bin/git push origin main