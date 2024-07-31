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
    -- keys = {
    --     {
    --         key = "f",
    --         mods = "SHIFT|CTRL",
    --         action = wezterm.action.SpawnCommandInNewTab({
    --             label = "Search for directory",
    --             args = {"fzf-search-for-dir"},
    --             set_environment_variables = {
    --                 PATH = os.getenv("PATH"),
    --             },
    --             domain = "CurrentPaneDomain",
    --         }),
    --     },
    -- },
}
