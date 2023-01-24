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

#result=$( xrandr | grep 'DVI-I-3-2 connected' )
#result=$( xrandr | grep 'DP-1-5-1 connected' )
result=$( xrandr | grep 'DisplayPort-0')

if [ -n "$result" ]; then
  echo "Dual screen setup @ the office"
  #xrandr --output DVI-I-2-1 --auto --right-of eDP-1
  #xrandr --output DVI-I-3-2 --auto --right-of DVI-I-2-1
  #xrandr --output DVI-I-3-2 --auto --right-of eDP-1
  #xrandr --output DVI-I-2-1 --auto --right-of DVI-I-3-2
  #xrandr --output DVI-I-2-1 --auto --right-of eDP-1
  #xrandr --output DVI-I-3-2 --auto --right-of DVI-I-2-1
  #xrandr --output eDP-1 --mode 1920x1080 --output DP-1-0.1 --right-of eDP-1 --output DP-1-0.2 --right-of DP-1-0.1
  xrandr --output eDP --mode 1920x1080
  xrandr --output DisplayPort-0 --auto --left-of eDP
  # xrandr --output DP-0.1 --auto --right-of eDP-1-1
  # xrandr --output DP-0.2 --auto --right-of DP-0.1
  exit 0
fi

echo "Laptop screen only"
xrandr --output eDP-1-1 --mode 1920x1080
