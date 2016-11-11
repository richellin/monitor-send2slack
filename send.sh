#!/bin/bash

#usage
##sh send.sh username message

# $1 : username
# $2 : message

ARGUMENT_CNT=2

if [ $# -ne $ARGUMENT_CNT ]; then
  echo $0 1>&2
  echo "The specified argument is $#." 1>&2
  echo "$ARGUMENT_CNT argument is required to execute." 1>&2

  exit 1
fi

# Your channel name : #general
channel="#general"
# Your username
username=$1
# Your message
message=$2
# Your hook url
hook_url='https://hooks.slack.com/services/##########################'

curl -X POST --data-urlencode "payload={\"channel\": \"$channel\", \"username\": \"$username\", \"text\": \"$message\"}" $hook_url
