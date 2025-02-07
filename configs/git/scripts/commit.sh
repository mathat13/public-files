#!/bin/sh

dirs=(
    "/shares/dfsroot/synced_files"
    "/shares/dfsroot/codeshare"
)

# State time and date
echo -e "\nDaily crontab backup for `date`"

for dir in "${dirs[@]}"; do
    # cd to public directory
    cd $dir || exit 1

    # Add and commit changes
    /usr/bin/git add --all
    /usr/bin/git commit -m "daily crontab backup `date`"

    # send data to Git server
    /usr/bin/git push origin main
done

# cd to private directory
#cd /shares/dfsroot/synced_files || exit 1
#
## Add and commit changes
#/usr/bin/git add --all
#/usr/bin/git commit -m "daily crontab backup `date`"
#
## send data to Git server
#/usr/bin/git push origin main