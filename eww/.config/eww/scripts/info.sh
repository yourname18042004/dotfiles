#!/bin/sh
EWW_PATH="/home/giapwibu/eww/target/release/eww" 
WINDOWS=$($EWW_PATH active-windows | grep -q "\*info")
if $EWW_PATH active-windows | grep -q "\*info"; then
    $EWW_PATH close info
    $EWW_PATH close info_corner_top_left
    $EWW_PATH close info_corner_bottom_right
    echo $WINDOWS
else
    $EWW_PATH open info
    $EWW_PATH open info_corner_top_left
    $EWW_PATH open info_corner_bottom_right
    echo $WINDOWS
fi
