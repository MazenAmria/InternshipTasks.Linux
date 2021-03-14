#!/bin/bash

temp_file=~/temp.$(date "+%Y.%m.%d-%H.%M.%S")

# dump the crontab to the temp file
crontab -l > $temp_file

# append the job to the temp file
echo "30 1 * * * ~/logged_in_users.sh" >> $temp_file

# reload the crontab form the edited temp file
crontab $temp_file

# remove the file
rm -f $temp_file
