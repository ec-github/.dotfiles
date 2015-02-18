#!/bin/bash

SS=/usr/bin/xfce4-screenshooter
DIR_PATH=/home/riccardo/Pictures/
DOMAIN=https://linux01.everycity.co.uk/~riccardo/
RSYNC=/usr/bin/rsync
LOGINS=riccardo@linux01:~/public_html
XCLIP=/usr/bin/xclip

$SS -r --save=$DIR_PATH
FILE=$(ls -tr $DIR_PATH | tail -n 1)

notify-send "Uploading file to $DIR_PATH$FILE"
echo "$DOMAIN$FILE" | $XCLIP -selection clipboard
$RSYNC --quiet $DIR_PATH$FILE $LOGINS
