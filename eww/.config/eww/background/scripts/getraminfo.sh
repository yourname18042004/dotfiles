#!/bin/sh
top -bn1 | grep "MiB Mem" | awk '{print ($8/$4)*100}' | awk -F. '{print $1}'
