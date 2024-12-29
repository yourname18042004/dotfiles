#!/bin/sh
top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | awk -F. '{print $1}'
