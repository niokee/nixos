local wezterm = require("wezterm")
local colors = require("colors.kanagawa")


local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider


return {
    animation_fps = 60,
    max_fps = 60,
    front_end = "WebGpu",
    webgpu_power_preference = "HighPerformance",
    webgpu_preffered_adapter = "Gl",

    colors = colors,

    background = {
       {
          source = { Color = colors.background },
          height = '100%',
          width = '100%',
          opacity = 0.90,
       },
    },
    tab_bar_at_bottom = true,


    tab_bar_style = {
        active_tab_left = wezterm.format {
            { Background = { Color = colors.background } },
            { Foreground = { Color = colors.foreground } },
            { Text = SOLID_LEFT_ARROW },
        },
        active_tab_right = wezterm.format {
            { Background = { Color = colors.background } },
            { Foreground = { Color = colors.foreground } },
            { Text = SOLID_RIGHT_ARROW },
        },
        inactive_tab_left = wezterm.format {
            { Background = { Color = colors.background } },
            { Foreground = { Color = colors.cursor_bg } },
            { Text = SOLID_LEFT_ARROW },
        },
        inactive_tab_right = wezterm.format {
            { Background = { Color = colors.background } },
            { Foreground = { Color = colors.cursor_bg } },
            { Text = SOLID_RIGHT_ARROW },
        },
    },

    enable_scroll_bar = true,
    
}
