#!/bin/sh
brightnessctl i | grep 'Current brightness' | awk '{print $4}' | tr -d '()%'
