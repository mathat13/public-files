#!/bin/bash

# Define log file location
LOGFILE="$HOME/.local/scripts/git-backups/logs/git-backups.log"
exec >> "$LOGFILE" 2>&1  # Redirect all stdout and stderr to the log

# Find all .git directories and return paths in an array
readarray -d '' git_dirs < <(find / -name ".git" -type d -print0 2>/dev/null)

# Define a list of parent paths for cding
parent_dirs=()

# Define a list of urls to each repository
repo_urls=()

# Set the owners that you would like to push to
desired_owner="mathat13"

# Populate the parent_dirs with the relevant paths
for dir in "${git_dirs[@]}"; do
    # Get the url of the remote repository for each project
    repo_url=$(git --git-dir $dir config --get remote.origin.url)

    # Check that the repo_url includes the desired_owner
    if grep -q "$desired_owner" <<< "$repo_url"; then
        # Add the required data to the required arrays
        repo_urls+=($"repo_url")
        parent_dirs+=("${dir%/*}")  # Remove "/.git" to get the parent directory
    fi
done

# State time and date
echo -e "\e[4;96mDaily crontab backup for `date`:\n\e[0m"

for dir in "${parent_dirs[@]}"; do

    # cd to public directory and return error and exit script if dir not found
    cd $dir 2>/dev/null || { echo -e "\e[31m[Error] Directory '$dir' not found! \n\e[0m"; exit 1;}

    # Get repository name
    repository=$(basename -s .git `git config --get remote.origin.url` 2>/dev/null || echo "")
    
    # State which directory we're pushing to
    echo -e "\e[93m[Status] Pushing contents of $dir to GitHub repository $repository:\n\e[0m"

    # Add and commit changes
    /usr/bin/git add --all
    /usr/bin/git commit -m "daily crontab backup `date`"

    # send data to Git server
    /usr/bin/git push origin main

    echo -e "\e[32m\n[Success] Push completed.\n\e[0m"
done