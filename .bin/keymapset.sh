#!/bin/bash

keymap_lookup(){
    keymaps=($(localectl list-keymaps | sort -V))
    select keymap in "${keymaps[@]}"; do
        if [[ -n "$keymap" ]]; then
            echo "$keymap"
            break
        else
            echo "Invalid selection"
        fi
    done
}

keymap_set(){
    keymap=$1
    loadkeys "$keymap"
    localectl set-keymap --no-convert "$keymap"
}