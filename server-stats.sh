#!/bin/bash

## Memory Usage

mem_total=$(free -m | grep Mem: | awk -F " " '{print $2}')
mem_used=$(free -m | grep Mem: | awk -F " " '{print $3}')
mem_free=$(free -m | grep Mem: | awk -F " " '{print $4}')
per_mem_used=$(free | grep Mem: | awk -F " " '{printf("Used: %.2f%%\n", ($2-$7)/$2*100)}')

echo "## Memory State ##"
echo " "
echo "Total Memory Available: $mem_total MiB"
echo "Used Memory: $mem_used MiB, $per_mem_used"
echo "Free Memory: $mem_free MiB"
echo " "

## CPU Usage

cpu_usage=$(LC_ALL=C | top -bn2 | grep '^%Cpu' | tail -n 1 | awk -F " " '{print ($2 + $4 + $6)}')

echo "## CPU State ##"
echo " "
echo "CPU Usage: $cpu_usage%"
echo " "

## Disk Usage

disk_size=$(df -h | grep -E "./$" | awk -F " " '{print $2}')
free_disk=$(df -h | grep -E "./$" | awk -F " " '{print $4}')
used_disk=$(df -h | grep -E "./$" | awk -F " " '{print $3}')
per_disk_used=$(df -h | grep -E "./$" | awk -F " " '{print $5}')

echo "## Disk Usage ##"
echo " "
echo "Disk Size: $disk_size"
echo "Free Disk: $free_disk"
echo "Used Disk: $used_disk, Used: $per_disk_used"
echo " "

## Top Five Processes by CPU Usage

top_proc=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)

echo "## Top Five Processes by CPU Usage ##"
echo " "
echo "$top_proc"
echo " "

## Top Five Processes by Memory Usage

top_proc_mem=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 6)

echo "## Top Five Processes by Memory Usage ##"
echo " "
echo "$top_proc_mem"
echo " "









