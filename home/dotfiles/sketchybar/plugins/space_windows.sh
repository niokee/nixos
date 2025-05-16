#!/usr/bin/env bash


for sid in $(aerospace list-workspaces --all); do
    apps="$(aerospace list-windows --workspace $sid --format '%{app-name}')"
    icon_strip=" "
    if [ "${apps}" != "" ]; then
        while read -r app
        do
          icon_strip+="$($CONFIG_DIR/plugins/icon_map.sh "$app")"
        done <<< "${apps}"
    else
        icon_strip="—"
    fi

    sketchybar --animate sin 10 --set space.$sid label="$icon_strip"
done

