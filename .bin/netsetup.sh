#!/bin/bash

net_config(){
    #select device list
    devices=($(iwctl device list | tail +5 | sed -E -e 's/\x1B\[[0-9;]*[mGKH]*//g' -e 's/[[:space:]]+//' -e 's/[[:space:]]{2,}/|/g' | cut -d '|' -f1))
    select device in "${devices[@]}"; do
        if [[ -n "$device" ]]; then
            iwctl device "$device" set-property Powered on
            iwctl station "$device" scan
            break
        else
            echo "Invalid selection"
        fi
    done

    #select SSID
    mapfile -t networks < <(iwctl station "$device" get-networks | tail +5 | sed -E -e 's/(\x1B\[[0-9;]*[mGKH])*//g' -e 's/^[*>[:space:]]+//' -e 's/[[:space:]]{2,}/|/g' | cut -d '|' -f1)
    select network in "${networks[@]}"; do
        if [[ -n "$network" ]]; then
            echo "$network"
            declare -p network
            iwctl station "$device" connect "$network"
            break
        else
            echo "Invalid selection"
        fi
    done
}

net_setup(){
    options=(ethernet wlan)
    select opt in "${options[@]}"; do
        case "$opt" in 
        "ethernet")
            break
        ;;
        "wlan")

            net_config
            break
        ;;
        esac
    done
}

net_setup