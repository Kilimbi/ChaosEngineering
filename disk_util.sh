# Script to quickly set amount of space left on disk and filling it immediately
# USAGE:
#
# CREATE A FILE LEAVING ONLY 100M ON FILESYSTEM
# $ sudo bash /data/disk_util.sh c 100 M sda2 /data/bigfile.data
#
# REMOVE THE PREVIOUSLY CREATED FILE
# $ sudo bash /data/disk_util.sh d 100 M sda2 /data/bigfile.data

#!/bin/env/bash

# Create (c) or delete (d) bigfile
create=$1

# Free space left after execution
left=$2

# Unit of space left (Can be K for Kilobytes, M for Megabytes, G for Gigabytes)
unit=$3

# Targeted partition
disk=$4

# Output file
outfile=$5

# Check for available space
avail=$(df --output=source,avail -B$unit | grep $disk | awk '{print $NF}' | sed s/$unit//i);
size=$((avail-left))

# If size available > space left after bigfile creation, use fallocate or default to head if not available 
if [ "$create" == "c" ]; then
  if [ "$size" -gt 0 ]; then
    fallocate -l $size$unit $outfile 2>/dev/null || head -c $size$unit /dev/zero > $outfile
  else
    echo "There is less than $left$unit of disk space available on $disk"
  fi
elif [ "$create" == "d" ]; then
  rm $outfile
else
  echo 'use "c" for creating or "d" for deleting a big file'
fi