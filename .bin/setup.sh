#!/bin/bash
. keymapset.sh
. systimeset.sh

keymap_str="us"
timezone_path="/usr/share/zoneinfo/US/Eastern"

configs(){
    echo "Keymap: $keymap_str"
    echo "Timezone: $timezone_path"
}

confirm(){
    keymap_set $keymap_str
    timezone_set $timezone_path
}

select opt in "Keymap" "Time" "Configs" "Confirm"; do
    case $opt in
        "Keymap")
            echo "keymap"
            keymap_str=$(keymap_lookup)
        ;;
        "Time")
            echo "time"
            timezone_path=$(timezone_lookup)
        ;;
        "Configs")
            configs
                ;;
        "Confirm")
            confirm
        break
    esac
done
        