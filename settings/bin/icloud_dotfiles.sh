#!/bin/bash

if [[ "$USER" != "ymka" ]]; then
  echo "USER is not ymka"
  exit
fi

# Function to get the current time in nanoseconds
get_current_time() {
    echo "$(/opt/homebrew/bin/gdate +%s%N)"
}

# Function to log the duration and completion of a task
log_duration_and_complete() {
    local start_time=$1
    local task_name=$2
    local end_time=$(get_current_time)
    local elapsed_time=$(( (end_time - start_time) / 1000000 )) # Convert to milliseconds
    echo "DONE: $task_name in ${elapsed_time} ms"
}

echo "----------------------------------------------------------------------------------------------------"

start_time=$(get_current_time)
echo "START: copying .zshrc"
rm -f "/Users/ymka/Library/Mobile Documents/com~apple~CloudDocs/Settings/zshrc"
/bin/cp "/Users/ymka/.zshrc" "/Users/ymka/Library/Mobile Documents/com~apple~CloudDocs/Settings/zshrc"
log_duration_and_complete $start_time "copying .zshrc"

echo "----------------------------------------------------------------------------------------------------"

start_time=$(get_current_time)
echo "START: copying Brewfile"
rm -f "/Users/ymka/Library/Mobile Documents/com~apple~CloudDocs/Settings/Brewfile"
/opt/homebrew/bin/brew bundle dump --file "/Users/ymka/Library/Mobile Documents/com~apple~CloudDocs/Settings/Brewfile"
log_duration_and_complete $start_time "copying Brewfile"

echo "----------------------------------------------------------------------------------------------------"

start_time=$(get_current_time)
echo "START: copying settings"
rm -rf "/Users/ymka/Library/Mobile Documents/com~apple~CloudDocs/Settings/mac_settings/"
/opt/homebrew/bin/rsync -qav --exclude "node_modules" --exclude ".git" "/Users/ymka/settings/" "/Users/ymka/Library/Mobile Documents/com~apple~CloudDocs/Settings/mac_settings/"
log_duration_and_complete $start_time "copying settings"

echo "----------------------------------------------------------------------------------------------------"

