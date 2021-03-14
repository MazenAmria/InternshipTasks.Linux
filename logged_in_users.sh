#!/bin/bash

date >> ~/logfile 
who | awk '{ print $1 }' >> ~/logfile
