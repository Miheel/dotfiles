#!/usr/bin/env bash

#Terminate already running bar instances
killall -q polybar

#whit until the process have been shut down
while grep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar top &

polybar bottom &
