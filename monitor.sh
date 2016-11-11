#!/bin/bash

#usage
#sh monitor.sh


# Exit if using
if [ $$ != `pgrep -fo $0`  ]; then
    echo "[`date '+%Y/%m/%d %T'`] myself is already running. exit myself."
    exit 1
fi

# Your process list
processes=(nginx php-fpm)

# Your host list
hosts=(127.0.0.1 localhost)

# Move directory
movePath=$(cd $(dirname $0) && pwd)
cd ${movePath}

# Check your processes
echo ===processes===
for process in ${processes[@]}; do
    echo 'sh process.sh '$process' > /dev/null 2>&1'
    sh process.sh $process > /dev/null 2>&1 &
done

# Check your hosts
echo ===hosts===
for host in ${hosts[@]}; do
    echo 'sh host.sh '$host' > /dev/null 2>&1'
    sh host.sh $host > /dev/null 2>&1 &
done
echo =========
