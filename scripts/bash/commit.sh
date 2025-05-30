#!/bin/bash

# Define log file location
LOGFILE="$HOME/.local/scripts/git-backups/logs/git-backups.log"
exec >> "$LOGFILE" 2>&1  # Redirect all stdout and stderr to the log

# Add dirs to push to here:
git_dirs=(
    "/shares/dfsroot/codeshare/.git"
    "/shares/dfsroot/synced_files/.git"
)

# Initialize parent_dirs
parent_dirs=()

# Populate the parent_dirs with the relevant paths
for dir in "${git_dirs[@]}"; do
        parent_dirs+=("${dir%/*}")  # Remove "/.git" to get the parent directory
done

# State time and date
echo -e "\e[4;96mDaily crontab backup for `date`:\n\e[0m"

for dir in "${parent_dirs[@]}"; do

    # cd to public directory and return error and exit script if dir not found
    cd $dir 2>/dev/null || { echo -e "\e[31m[Error] Directory '$dir' not found! Moving to next directory \n\e[0m"; continue;}

    # Get repository name
    repository=$(basename -s .git $(git config --get remote.origin.url) 2>/dev/null)
    
    # State which directory we're pushing to
    echo -e "\e[93m[Status] Pushing contents of $dir to GitHub repository $repository:\n\e[0m"

    # Add and commit changes
    /usr/bin/git add --all || { echo -e "\e[31m[Error] git add unsuccessful, please check output and re-run script.  Moving to next directory  \n\e[0m"; continue;}
    /usr/bin/git commit -m "daily crontab backup `date`" || { echo -e "\e[31m[Error] Commit unsuccessful, resetting to unstaged file and moving to next directory  \n\e[0m"; git reset; continue;}

    # send data to Git server
    /usr/bin/git push origin main || { echo -e "\e[31m[Error] Push unsuccessful, resetting to unstaged file and moving to next directory. \n\e[0m"; git reset --mixed HEAD~1; continue;}

    echo -e "\e[32m\n[Success] Push completed.\n\e[0m"
done