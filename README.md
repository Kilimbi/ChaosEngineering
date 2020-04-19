# ChaosEngineering
Series of scripts to simulate conditions of disk space, cpu stress and network delay

Scripts requiring elevated privileges have `sudo` on the given examples.

Be sure to install the dependency packages specified on each script before running.

## Usage:

Each script can be run with parameters to enable/disable certain test conditions.

### disk_util.sh (uses fallocate to instantly create an arbitrary size file)
CREATE A FILE LEAVING ONLY 100M ON FILESYSTEM

```$ sudo bash /data/disk_util.sh c 100 M sda2 /data/bigfile.data```

REMOVE THE PREVIOUSLY CREATED FILE

```$ sudo bash /data/disk_util.sh d 100 M sda2 /data/bigfile.data```

### stress_cpu.sh (leverages stress-ng framework to more accurately stress specific cores)

CREATE 100% LOAD FOR 3 CPU CORES FOR 10 MINUTES

```$ /data/stress_cpu.sh start 3 10m```

STOP ALL STRESS TESTING

```$ /data/stress_cpu.sh stop```

### test_delay.sh (leverages iproute-tc to create precise networking delay)

ADD 100ms DELAY RULE

```$ sudo ./test_delay.sh add eth0 100ms```

DELETE 100ms DELAY RULE

```$ sudo ./test_delay.sh delete eth0 100ms```
