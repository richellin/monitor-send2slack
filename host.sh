#!/bin/bash

#usage
#sh ping.sh HOST &

if [ $# -ne 1 ]; then
    echo "The specified argument is $#." 1>&2
    echo "1 argument is required to execute." 1>&
    exit 1
fi

cnt=$(pgrep -fo "${self} ${@}" | grep -v ${$} | grep -v grep | wc -l)
echo "cnt : ${cnt}"

# Exit if using
if [[ $cnt -gt 0  ]]; then
    echo "[$DT] myself is already running. exit myself."
    exit 1
fi

HOST=$1

DT=`date "+%Y/%m/%d %H:%M:%S"`

while :
do
    ping -w 5 -n -c 1 $HOST >> /dev/null
    if [ $? -eq 0 ]
    then
      echo aaa
      sleep 5
    else
      sh send.sh "monitor" "$DT  Host[$HOST] is downed"
      break
    fi
done
