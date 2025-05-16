#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# name of the focused monitor
monitor_name=$(aerospace list-monitors --focused --format '%{monitor-name}')
case $monitor_name in
  "Built-in Retina Display")
    monitor_name="Color LCD"
    ;;
  *) ;;
esac

# display information of the focused monitor
jq_filter=".SPDisplaysDataType[].spdisplays_ndrvs[] | select(._name == \"${monitor_name}\") | ._spdisplays_resolution"
display_info=$(system_profiler SPDisplaysDataType -json | "/opt/homebrew/bin/jq" -r "${jq_filter}")

screen_width=$(echo "${display_info}" | cut -d ' ' -f 1)
screen_height=$(echo "${display_info}" | cut -d ' ' -f 3)
