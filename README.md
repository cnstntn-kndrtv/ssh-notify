# ssh-notify
  

1. create Slack app and **incoming webhook** https://slack.com/intl/en-ru/help/articles/115005265063-Incoming-WebHooks-for-Slack?eu_nc=1  

2. edit `./ssh-notify/notify.sh`  
   change url and channel for Slack notifications:  
    url="<YOUR_SLACK_INCOMING_WEBHOOK>"  
    channel="#general"  

3. 
```sh
sudo cp -r ./ssh-notify /usr/local/
# make it executable
sudo chmod +x /usr/local/ssh-notify/notify.sh
```

4. to `/etc/pam.d/sshd` add this line:  
```
session optional pam_exec.so seteuid /usr/local/ssh-notify/notify.sh
```
5. try to ssh to your sever
   
icon from flaticon.com