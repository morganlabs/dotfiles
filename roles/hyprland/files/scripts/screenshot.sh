#!/bin/sh

RADIUS=6
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

function notify() {
    notify-send --app-name="Screenshot" "$@"
}

function screenshot() {
    FULL_PATH="$SCREENSHOT_DIR/$(date +'%Y/%d-%m_%H-%M-%S').png"
    [[ ! -d "$FULL_PATH" ]] && mkdir -p `dirname "$FULL_PATH"`

    grim "$@" -t png - | {
        convert - \
            \( +clone  -alpha extract \
            -draw "fill black polygon 0,0 0,$RADIUS $RADIUS,0 fill white circle $RADIUS,$RADIUS $RADIUS,0" \
            \( +clone -flip \) -compose Multiply -composite \
            \( +clone -flop \) -compose Multiply -composite \
            \) -alpha off -compose CopyOpacity -composite "$FULL_PATH"
    }

    if [[ $? -ne 0 ]]; then
        echo "Screenshot failed/cancelled"
        exit -1
    fi

	wl-copy -t "image/png" < "$FULL_PATH"

	echo "Screenshot saved to $FULL_PATH"
	notify "Screenshot saved" "Screenshot has been saved to $(sed "s|^$HOME|~|" <<< "$FULL_PATH")" -i "$FULL_PATH"
}

# Shamelesssly stolen (and then modified) from https://github.com/Gustash/Hyprshot
function grab_window() {
    local monitors=`hyprctl -j monitors`
    local clients=`hyprctl -j clients | jq -r '[.[] | select(.workspace.id | contains('"$(jq -r 'map(.activeWorkspace.id) | join(",")' <<< "$monitors")"'))]'`
    local boxes=`jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' <<< "$clients"`
    local count=`wc -l <<< "$boxes"`

    if [[ "$count" -eq 1 ]]; then
        echo "$boxes"
    else
        slurp -r <<< "$boxes"
    fi
}

OPTION="$1"

case "$OPTION" in
    "selection") screenshot -g "$(slurp)" ;;
    "window") screenshot -g "$(grab_window)" ;;
	"screen") screenshot ;;
	*) echo "Please select an option." ;;
esac
