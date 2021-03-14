#!/bin/bash

# Run the sleep command for 10 mins in background
sleep 10m &

# extract the process info
process=$(ps -aux | grep -w 'sleep')

# extract the pid
pid=$(echo $process | awk '{ print $2 }')

# kill the process with SIGKILL
kill -s 9 $pid
