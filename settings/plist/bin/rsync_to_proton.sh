#!/bin/bash

rclone sync ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Settings proton:Settings
rclone sync ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents proton:Documents
rclone sync ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Health proton:Health
rclone sync ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Passwords proton:Passwords