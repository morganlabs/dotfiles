#!/bin/sh

case "$1" in
    "up")
        pamixer --increase 5;;
    "down")
        pamixer --decrease 5;;
esac

if ! command -v eww &> /dev/null; then
    if [[ -f "$HOME/eww/target/release/eww" ]]; then
        $HOME/eww/target/release/eww update volume="$(~/.config/eww/scripts/volume.sh)"
    fi
else
    eww update volume="$(~/.config/eww/scripts/volume.sh)"
fi

