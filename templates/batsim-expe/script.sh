#!/usr/bin/env sh
robin --output-dir ./out \
      --batcmd="batsim -p ${PLATFORM_DIR}/small_platform.xml -w ${WORKLOAD_DIR}/test_one_delay_job.json -e out/" \
      --schedcmd="batsched"
