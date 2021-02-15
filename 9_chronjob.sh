chrontab -e
# Then add the following line
# 30 1 * * * echo $(date) - $(w --no-headers | awk 'BEGIN { ORS = " " } { print $1 }') >> logfile
