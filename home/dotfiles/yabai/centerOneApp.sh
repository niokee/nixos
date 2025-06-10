#!/usr/bin/env bash

SPACE=$(yabai -m query --spaces --display 1 | jq -r '.[] | select(.["has-focus"] == true) | .index')
if yabai -m query --windows --display 1 | jq -ec '[.[] | select(.["is-visible"] == true)] | length == 1' > /dev/null; then 
  yabai -m config --space $SPACE left_padding 600
  yabai -m config --space $SPACE right_padding 600
elif yabai -m query --windows --display 1 | jq -ec '[.[] | select(.["is-visible"] == true)] | length == 2' > /dev/null; then 
  yabai -m config --space $SPACE left_padding 600
  yabai -m config --space $SPACE right_padding 600
else
  yabai -m config --space $SPACE left_padding 12
  yabai -m config --space $SPACE right_padding 12
fi
