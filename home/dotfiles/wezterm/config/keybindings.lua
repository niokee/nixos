local wezterm = require("wezterm")

return {
    key_tables = {
        copy_mode = {
            {
                key = "d",
                mods = "CTRL",
                action = wezterm.action.DisableDefaultAssignment,
            },
        },
    },
    keys = {
        {
            key = "F",
            mods = "CTRL|SHIFT",
            action = wezterm.action_callback(function(window, _)
                local _, pane, _ = window:mux_window():spawn_tab({})
                pane:send_text('fzf --bind "enter:become($EDITOR {})"; wezterm cli kill-pane\n')
            end),
        },
    },
}
