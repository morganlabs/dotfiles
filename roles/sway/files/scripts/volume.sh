#!/bin/sh

ACTION="$1"

case "$ACTION" in
  "inc")
      pamixer -i 5
    ;;
  "dec")
      pamixer -d 5
    ;;
  "mut")
      pamixer --toggle-mute
    ;;
  *)
    echo "Please choose one of the following options: inc, dec, mut"
esac

pkill -SIGRTMIN+10 i3blocks
