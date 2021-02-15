sleep 10m
kill -s 9 `ps -aux | grep 6_bash_and_processes.sh | awk '{ print $2 }'`
