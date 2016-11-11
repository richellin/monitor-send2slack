#!/bin/sh

#usage
#sh process.sh porcessName

if [ $# -ne 1 ]; then
  echo "The specified argument is $#." 1>&2
  echo "1 argument is required to execute." 1>&2
  exit 1
fi


self=$0
processName=$1
interval=10
DT=`date "+%Y/%m/%d %H:%M:%S"`


cnt=$(pgrep -fo "${self} ${@}" | grep -v ${$} | grep -v grep | wc -l)
echo "cnt : ${cnt}"

# Exit if using
if [[ $cnt -gt 0  ]]; then
    echo "[$DT] myself is already running. exit myself."
    exit 1
fi

while true
do
    echo "processName : $processName"

    isAlive=`ps ax | grep $processName | grep -v grep | grep -v $self | wc -l`
    echo "isAlive : $isAlive"
    if [ $isAlive -gt 0 ]; then
        echo "proccess is running."
    else
        #Send a message to slack
        sh send.sh "monitor" "$DT  Process[$processName] is downed. "
        break

    fi
    sleep $interval
done
