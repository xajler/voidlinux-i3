#!/bin/bash
path1=/sys/class/hwmon/hwmon0
path2=/sys/class/hwmon/hwmon1
path1Name=$(cat "$path1/name")
path2Name=$(cat "$path2/name")


if [ "$path1Name" == "coretemp" ]; then # && [ -f "$path1/temp2_input" ]; then
  cat "$path1/temp2_input" | awk '{print substr($1, 1, 2) "°C"}'
fi

if [ "$path2Name" == "coretemp" ]; then
  cat "$path2/temp2_input" | awk '{print substr($1, 1, 2) "°C"}'
fi
