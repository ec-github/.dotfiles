#!/bin/bash

SS=/usr/bin/xfce4-screenshooter
DIR_PATH=/home/riccardo/Pictures/
DOMAIN=https://somedomain/com/~riccardo/
RSYNC=/usr/bin/rsync
LOGINS=usernmae@server:~/public_html
XCLIP=/usr/bin/xclip

$SS -r --save=$DIR_PATH
FILE=$(ls -tr $DIR_PATH | tail -n 1)

notify-send "Uploading file to $DIR_PATH$FILE"
echo "$DOMAIN$FILE" | $XCLIP -selection clipboard
$RSYNC --quiet $DIR_PATH$FILE $LOGINS
