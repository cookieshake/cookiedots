#!/bin/bash
set -e
command=$1

if [[ $command = "open" ]]; then
  if [[ $(hyprctl monitors -j | jq 'any(.[].name; IN("DP-1","DP-2","HDMI-A-1"))') == "true" ]]; then
    hyprctl keyword monitor "eDP-1,preffered,auto,2"
    #sleep 1
    #hyprctl keyword monitor "DP-1,preferred,auto,2,mirror,eDP-1"
    #sleep 1
    #hyprctl keyword monitor ",preferred,auto,2,mirror,eDP-1"
  fi
fi

if [[ $command = "close" ]]; then
  #hyprctl keyword monitor "DP-1,preffered,auto,2"
  sleep 1
  if [[ $(hyprctl monitors -j | jq 'any(.[].name; IN("DP-1","DP-2","HDMI-A-1"))') == "true" ]]; then
    #hyprctl keyword monitor ",preffered,auto,2,mirror,DP-1"
    #sleep 1
    hyprctl keyword monitor "eDP-1,disabled"
  fi
fi
