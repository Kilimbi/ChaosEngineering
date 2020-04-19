# Script to test simulated network latency
# Required to install 'kernel-modules-extra' and 'iproute-tc' as below (CentOS 8)
# $ sudo yum install iproute-tc kernel-modules-extra -y
#
# USAGE:
#
# ADD 100ms DELAY RULE
# $ ./test_delay.sh add eth0 100ms
# 
# DELETE 100ms DELAY RULE
# $ ./test_delay.sh delete eth0 100ms 

#!/bin/env/bash

# Add or delete delay rule
run=$1

# Interface to be tested (eth1, eth0, etc)
interface=$2

# Amount of delay added (in ms)
delay=$3

if [ "$run" == "add" ]; then
  tc qdisc add dev $interface root netem delay $delay
elif [ "$run" == "delete" ]; then
  tc qdisc delete dev $interface root netem delay $delay
else
  echo 'Need to use "add" or "delete" as the first argument'
fi