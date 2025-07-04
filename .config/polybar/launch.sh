#!/usr/bin/env bash

#Terminate already running bar instances
killall -q polybar

#wait until the process have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar top -r &
polybar bottom -r &
