#!/bin/bash

# Find all .git directories and return in an array
readarray -d '' git_dirs < <(find / -name ".git" -type d -print0 2>/dev/null)

# Define a list of parent paths for cding
parent_dirs=()

# Populate the parent_dirs with the relevant paths
for dir in "${git_dirs[@]}"; do
    parent_dirs+=("${dir%/*}")  # Remove "/.git" to get the parent directory
done

# State time and date
echo -e "\e[4;96mDaily crontab backup for `date`:\n\e[0m"

for dir in "${parent_dirs[@]}"; do

    # cd to public directory and return error and exit script if dir not found
    cd $dir 2>/dev/null || { echo -e "\e[31m[Error] Directory '$dir' not found! \n\e[0m"; exit 1;}

    # State which directory we're pushing to
    echo -e "\e[93m[Status] Pushing contents of $dir to GitHub repository:\n\e[0m"

    # Add and commit changes
    /usr/bin/git add --all
    /usr/bin/git commit -m "daily crontab backup `date`"

    # send data to Git server
    /usr/bin/git push origin main

    echo -e "\e[32m\n[Success] Push completed.\n\e[0m"
done