#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

SELECTED="false"
COLOR=$BACKGROUND_2
if [ "$NAME" = "space.$FOCUSED_WORKSPACE" ]; then
    COLOR=$GREY 
    SELECTED="true"
fi

sketchybar --set "$NAME" background.border_color="$COLOR" \
                        icon.highlight="$SELECTED" \
                        label.highlight="$SELECTED" 
                        
