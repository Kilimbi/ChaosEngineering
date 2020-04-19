# Script to stress CPU leveraging the 'stress-ng' test framework
# Required to install 'stress-ng' as below (CentOS8)
# $ sudo wget http://dl.marmotte.net/rpms/redhat/el8/x86_64/stress-1.0.4-23.el8/stress-1.0.4-23.el8.x86_64.rpm
# $ sudo rpm -i stress-1.0.4-23.el8.x86_64.rpm
#
# USAGE:
#
# CREATE 100% LOAD FOR 3 CPU CORES FOR 10 MINUTES
# $ ./stress_cpu.sh start 3 10m
# 
# STOP ALL STRESS TESTING
# $ ./stress_cpu.sh stop

#!/bin/env/bash

# Start or stop the test
run=$1

# Number of cores to be stressed
cores=$2

# Amount of time that the test will take (You can use 10s for 10 seconds or 10m for 10 minutes)
timer=$3

if [ "$run" == "start" ]; then
  stress -c $cores -t $timer
elif [ "$run" == "stop" ]; then
  killall stress
else
  echo 'Need to use "start" or "stop" as the first argument'
fi
