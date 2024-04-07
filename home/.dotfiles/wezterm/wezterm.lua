local wezterm = require('wezterm')
local colors = require('colors')
local config = wezterm.config_builder()


config.font = wezterm.font 'JetBrains Mono'
config.colors = {
    foreground = palette.fujiWhite,
    background = palette.sumInk3,

    -- cursor_bg = "",
    cursor_fg = palette.oldWhite,
    -- cursor_border = "",

    selection_bg = palette.waveBlue,
    selection_fg = palette.oldWhite,
    
    -- scrollbar_thumb = "",

    -- url_color = palette.springBlue,

    -- split = "",

    ansi = {
        palette.sumInk0,
        palette.autumnRed,
        palette.springGreen,
        palette.boatYellow1,
        palette.springBlue,
        palette.springViolet,
        palette.springBlue,
        palette.fujiWhite,
        palette.fujiGrey,
        palette.samuraiRed,
        palette.springGreen,
        palette.boatYellow1,
        palette.springBlue,
        palette.springViolet,
        palette.springBlue,
        palette.fujiWhite
    },

    brights = {
        palette.fujiGrey,
        palette.samuraiRed,
        palette.springGreen,
        palette.carpYellow,
        palette.springBlue,
        palette.springViolet,
        palette.waveAqua2,
        palette.fujiWhite,
    }

-- Tabs
    -- compose_cursor = "",
    -- copy_mode_active_highlight_bg = "",
    -- copy_mode_active_highlight_fg = "",
    -- copy_mode_inactive_highlight_bg = "",
    -- copy_mode_inactive_highlight_fg = "",
    --
    -- quick_select_label_bg = "",
    -- quick_select_label_fg = "",
    -- quick_select_match_bg = "",
    -- quick_select_match_fg = "",
}

return config
