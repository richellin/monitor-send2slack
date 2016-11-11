# monitor-send2slack
+ Send a message to slack using shell script

### Use
```
bash shell script
Incoming Webhooks of Slack
```

### Change
```
vi monitor.sh
# Your process list
processes=(nginx php-fpm)

# Your host list
hosts=(127.0.0.1 localhost)

vi send.sh
# Your channel name : #general
channel="#general"

# Your hook url
hook_url='https://hooks.slack.com/services/##########################'
```

### Start
```
sh monitor.sh

#or clontab
@reboot /Your Path/monitor.sh
```
