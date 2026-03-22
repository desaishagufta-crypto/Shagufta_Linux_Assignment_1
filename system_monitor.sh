#!/bin/bash

LOGFILE="system_monitor.log"

echo "===== System Monitoring Report =====" >> $LOGFILE
date >> $LOGFILE

echo "---- CPU Usage ----" >> $LOGFILE
top -l 1 | head -10 >> $LOGFILE

echo "---- Disk Usage ----" >> $LOGFILE
df -h >> $LOGFILE

echo "---- Top CPU Processes ----" >> $LOGFILE
ps -Ao pid,pcpu,comm | sort -k2 -nr | head >> $LOGFILE

echo "---- Top Memory Processes ----" >> $LOGFILE
ps -Ao pid,pmem,comm | sort -k2 -nr | head >> $LOGFILE

echo "===================================" >> $LOGFILE
