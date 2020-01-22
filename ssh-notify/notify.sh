#!/bin/bash

# popup
export DISPLAY=:0
notify-send "Security Warning" "SSH Connection Established with \"$USER\" $(echo $SSH_CONNECTION | sed 's/\(.*\) \(.*\) \(.*\) \(.*\)/from \1:\2 to \3:\4/')" \
-u critical -i /usr/local/alert/icon.png

# play sound
beep -f 500 -l 100
# play /usr/local/alert/sound.wav > /dev/null 2>&1
