#!/bin/bash

if [ "$PAM_TYPE" != "close_session" ]; then 

    # popup
    export DISPLAY=:0
    notify-send "Security Warning" "SSH Connection Established with \"$USER\" $(echo $SSH_CONNECTION | sed 's/\(.*\) \(.*\) \(.*\) \(.*\)/from \1:\2 to \3:\4/')" \
            -u critical -i /usr/local/alert/icon.png 

    # Slack notification
    url="<YOUR_SLACK_INCOMING_WEBHOOK>"
    channel="#general"
    
    host="$(hostname)"
    content="\"attachments\": [ { 
        \"mrkdwn_in\": [\"text\", \"fallback\"], 
        \"fallback\": \"SSH login: $PAM_USER connected to \`$host\`\", 
        \"text\": \"⚠SSH login to \`$host\`\", 
        \"fields\": [ 
            { 
                \"title\": \"User\", 
                \"value\": \"$PAM_USER\", 
                \"short\": true 
            }, { 
                \"title\": \"IP Address\", 
                \"value\": \"$PAM_RHOST\", 
                \"short\": true } 
        ], 
        \"color\": \"#F35A00\" 
    } ]"


    curl -X POST --data-urlencode "payload={
        \"channel\": \"$channel\", 
        \"mrkdwn\": true, 
        \"username\": \"SSH Notifications\", 
        $content
    }" "$url"


    # play sound
    beep -f 500 -l 100 ;
    # play /usr/local/alert/sound.wav > /dev/null 2>&1

fi