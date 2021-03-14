#!/bin/bash

key=~/.ssh/id_rsa.pub

if [ ! -f "$key" ]; then
    ssh-keygen
else
    echo "Public SSH key exists"
fi

ssh-copy-id $1
# It requires a password to copy the key
# but once the key is copied the login 
# doesn't require any password

ssh $1
