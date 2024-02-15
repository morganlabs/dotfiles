#!/bin/sh

# This is a mess...
# I really wanna move away from Apple Music and towards a self-hosted option like Navidrome
# but I don't have the hardware for it
# Well, I do, but it's loud and I plan on selling it. It can absolutely do the job, just not for 24/7 work unfortunately.
# If you stumble upon this and have any hardware reccomendations for a Navidrome server, send me an email me@morganlabs.dev

function get_shairplay_info() {
    ~/shairport-metadata-reader/shairport-sync-metadata-reader < /tmp/shairport-sync-metadata
}

PREVIOUS_OUTPUT=""

function parse_line() {
    local line="$1"
    if [[ "$line" == "Title:"* ]]; then
        TITLE=`cut -d'"' -f2 <<< "$line"`
    elif [[ "$line" == "Artist:"* ]]; then
        ARTIST=`cut -d'"' -f2 <<< "$line"`
    fi

    if [ -z "$TITLE" ]; then
        TITLE="Unknown"
    fi

    if [ -z "$ARTIST" ]; then
        ARTIST="Unknown"
    fi

    OUTPUT="{ \"nothing\": false, \"status\": \"Unknown\", \"title\": \"$TITLE\", \"artist\": \"$ARTIST\" }"
    if [[ "$OUTPUT" != "$PREVIOUS_OUTPUT" ]]; then
        echo "$OUTPUT"
        PREVIOUS_OUTPUT="$OUTPUT"
    fi
}

playerctl metadata --player=cider2,spotify --follow --format '{ "nothing": false, "status": "{{ status }}", "title": "{{ title }}", "artist": "{{ artist }}" }' & \
    get_shairplay_info | while read -r line; do
    parse_line "$line"
done
