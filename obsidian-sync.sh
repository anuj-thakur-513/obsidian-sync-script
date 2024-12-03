#! /bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

echo "Starting Obsidian sync script"
LOG_FILE=~/Developer/scripts/obsidian-sync.log
exec > "$LOG_FILE" 2>&1
# change directory to obsidian vault
cd /Users/anujthakur/Documents/obsidian-vault || { echo "Directory not found"; exit 1; }
# check if git is initialized
if [ ! -d ".git" ]; then
    echo "Please initialize git"
    exit 1
fi

# get current date and time
current_date_time=$(date "+%Y-%m-%d %H:%M:%S")

commit_message="updating obsidian notes on $current_date_time"

git add .
git commit -m "$commit_message"
git push

echo "Obsidian synced succesfully to github"
