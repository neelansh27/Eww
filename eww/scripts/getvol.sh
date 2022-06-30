#!/usr/bin/bash
vol=$(amixer sget Master | awk -F'[][]' '/Right:|Mono:/ && NF > 1 {sub(/%/, ""); printf "%0.0f\n", $2}')
# volume(){
# }

icon(){
    status=$( amixer | grep "Front Left: P"  | awk '{print($6)}')
    if [[ "$vol" == "0" || "$status" == "[off]" ]] ; then
       echo 婢
    elif [[ $vol -ge 1 && $vol -le 31 ]] ; then
       echo 奔
    elif [[ $vol > 30 && $vol < 65 ]] ; then
       echo 墳
    elif [[ $vol -gt 64 ]] ; then
       echo 
    fi
}
if [[ "$1" == "-V" ]] ; then
    echo $vol
elif [[ "$1" == "-i" ]] ; then
    icon
fi
