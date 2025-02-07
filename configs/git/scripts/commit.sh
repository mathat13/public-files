dirs=(
    "/shares/dfsroot/synced_files"
    "/shares/dfsroot/codeshare"
)

# State time and date
echo -e "\e[93mDaily crontab backup for `date`\n\e[0m"

for dir in "${dirs[@]}"; do

    # State which directory we're pushing to
    echo -e "Pushing contents of $dir to GitHub repository:\n"

    # cd to public directory
    cd $dir || exit 1

    # Add and commit changes
    /usr/bin/git add --all
    /usr/bin/git commit -m "daily crontab backup `date`"

    # send data to Git server
    /usr/bin/git push origin main

    echo -e "\nPush completed.\n"
done