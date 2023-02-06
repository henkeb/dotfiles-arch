#!/bin/bash

xrandr --output DP-2 --off
xrandr --output DP-0.1 --off
xrandr --output DP-0.2 --off

result=$( xrandr | grep 'HDMI-A-0 connected' )

if [ -n "$result" ]; then
  echo "Home setup"
  xrandr --output eDP --mode 1920x1080 --output HDMI-A-0 --auto --left-of eDP
  #xrandr --output eDP-1-1 --mode 1920x1080 --output DP-2 --mode 1920x1080 --rate 120 --primary --left-of eDP-1-1
  exit 0
fi

result=$( xrandr | grep 'DisplayPort-0')

if [ -n "$result" ]; then
  echo "Dual screen setup @ the office"
  xrandr --output eDP --mode 1920x1080
  xrandr --output DisplayPort-0 --auto --left-of eDP --scale 1x1 --dpi 140
  exit 0
fi

echo "Laptop screen only"
xrandr --output eDP-1-1 --mode 1920x1080
