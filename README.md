# ssh-notify
  
```sh
sudo cp -r ./ssh-notify /usr/local/
# make it executable
sudo chmod +x /usr/local/ssh-notify/notify.sh
```
  
to `/etc/pam.d/sshd` add this line:  
```
session optional pam_exec.so seteuid /usr/local/ssh-notify/notify.sh
```
  
  
icon from flaticon.com