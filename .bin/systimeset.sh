#!/bin/bash

menu(){

    items=("$@")
    select item in "${items[@]}"; do
        if [[ -n "$item" ]]; then
            echo "$item"
            break
        else
            echo "Invalid selection" >&2
        fi
    done
}

timezone_lookup(){
    timezone=/usr/share/zoneinfo/
    regions=($(ls $timezone))
    region=""
    city=""
    #print message to stderr
    echo "Select what region you are in." >&2
    region=($(menu "${regions[@]}"))
    timezone+=$region
    if [[ -d $timezone ]]; then
        cities=($( ls $timezone))
        timezone+=/  
        echo "select what city is closest to you." >&2
        city=($(menu "${cities[@]}"))
        timezone+=$city
        #print "return value" to stdout
        echo $timezone
    elif [[ -f $timezone ]]; then
        echo $timezone
    fi    
}

timezone_set(){
    timezone=$1
    ln -sf "$timezone" "/etc/localtime"
    
    hwclock --systohc
}