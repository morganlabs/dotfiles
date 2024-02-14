#!/bin/sh

VOLUME=`pamixer --get-volume`
SINK=`pamixer --get-default-sink | tail -n 1 | cut -d'"' -f4`
MUTED=`pamixer --get-mute`
ICON="󰕾"

if [[ "$MUTED" = "true" ]]; then
	VOLUME="<s>$VOLUME%</s>"
else 
	VOLUME="$VOLUME%"
fi

declare -A SINK_ICONS
SINK_ICONS+=(
	["FIFINE K670 Microphone Analog Stereo"]="󰍬"
	["Navi 21/23 HDMI/DP Audio Controller Digital Stereo"]="󰽟"
	["Family 17h (Models 00h-0fh) HD Audio Controller Analog Stereo"]="󰋋"
	["Starship/Matisse HD Audio Controller Analog Stereo"]="󰋋"
)

for key in "${!SINK_ICONS[@]}"; do
	value="${SINK_ICONS[${key}]}"
	if [[ "$SINK" == *"$key"* ]]; then
		ICON="$value"
		break
	fi
done

OUTPUT+="{"
OUTPUT+="\"volume\": \"$VOLUME\","
OUTPUT+="\"icon\": \"$ICON\","
OUTPUT+="\"sink\": \"$SINK\"",
OUTPUT+="\"mute\": $MUTED"
OUTPUT+="}"

echo "$OUTPUT"

