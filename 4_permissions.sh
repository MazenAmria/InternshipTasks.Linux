#!/bin/bash

cp /etc/fstap /var/tmp/admin

# Make user1 as the owner
chown user1:user1 /var/tmp/admin

# Owner (user1) can read and write
# Group (TrainingGroup) can read only
# Others (user2 for example) have no permissions
chmod 640 /var/tmp/admin
