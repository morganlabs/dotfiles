#!/bin/sh

ACTION="$1"

case "$ACTION" in
  "inc")
    brightnessctl set 5%+
    ;;
  "dec")
    brightnessctl set 5%-
    ;;
  *)
    echo "Please choose one of the following options: inc, dec"
esac

pkill -SIGRTMIN+20 i3blocks
