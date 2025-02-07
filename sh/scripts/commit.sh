#!/bin/sh

# State time and date
echo $"\nDaily crontab backup for `date`\n"

# cd to public directory
cd /shares/dfsroot/codeshare || exit 1

# Add and commit changes
/usr/bin/git add --all
/usr/bin/git commit -m "daily crontab backup `date`"

# send data to Git server
/usr/bin/git push origin main

# cd to private directory
cd /shares/dfsroot/synced_files || exit 1

# Add and commit changes
/usr/bin/git add --all
/usr/bin/git commit -m "daily crontab backup `date`"

# send data to Git server
/usr/bin/git push origin main