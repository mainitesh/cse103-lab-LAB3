#!/bin/bash
echo "================================"
echo "       SYSTEM REPORT"
echo "================================"
echo
echo "1. CPU INFORMATION"
grep -m1 "model name" /proc/cpuinfo
echo
echo "2. MEMORY INFORMATION"
if command -v free >/dev/null 2>&1; then
  free -h
else
  grep -E "MemTotal|MemFree|MemAvailable" /proc/meminfo
fi
echo
echo "3. DISK USAGE"
df -h /
echo
echo "4. RUNNING PROCESSES"
ps | head -6
echo
echo "5. SYSTEM UPTIME"
if command -v uptime >/dev/null 2>&1; then
  uptime
else
  awk '{printf "Up %d hours %d minutes\n", $1/3600, ($1%3600)/60}' /proc/uptime
fi
echo
echo "================================"
echo "       REPORT COMPLETED"
echo "================================"
