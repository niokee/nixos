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
}
