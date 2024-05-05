#!/bin/bash

/opt/homebrew/bin/git --git-dir="$HOME/.git_settings/" --work-tree="$HOME" pull origin master

localCommit=$(/opt/homebrew/bin/git --git-dir="$HOME/.git_settings/" --work-tree="$HOME" rev-parse master)
remoteCommit=$(/opt/homebrew/bin/git --git-dir="$HOME/.git_settings/" --work-tree="$HOME" ls-remote origin master | awk '{print $1}')

if [ "$localCommit" != "$remoteCommit" ]; then
  echo "Local branch is not up to date with origin/master. Please pull the latest changes for settings."
  exit 1
fi
