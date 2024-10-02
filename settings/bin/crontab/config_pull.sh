#!/opt/homebrew/bin/zsh

exec &>> /tmp/config_pull.log

date

/opt/homebrew/bin/git --git-dir=$HOME/.git_settings --work-tree=$HOME pull origin master