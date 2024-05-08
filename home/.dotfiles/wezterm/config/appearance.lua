local wezterm = require("wezterm")
local colors = require("colors.kanagawa")

local process_icons = {
	["docker"] = wezterm.nerdfonts.linux_docker,
	["docker-compose"] = wezterm.nerdfonts.linux_docker,
	["psql"] = "󱤢",
	["usql"] = "󱤢",
	["kuberlr"] = wezterm.nerdfonts.linux_docker,
	["ssh"] = wezterm.nerdfonts.fa_exchange,
	["ssh-add"] = wezterm.nerdfonts.fa_exchange,
	["kubectl"] = wezterm.nerdfonts.linux_docker,
	["stern"] = wezterm.nerdfonts.linux_docker,
	["nvim"] = wezterm.nerdfonts.custom_neovim,
	["make"] = wezterm.nerdfonts.seti_makefile,
	["vim"] = wezterm.nerdfonts.dev_vim,
	["node"] = wezterm.nerdfonts.mdi_hexagon,
	["go"] = wezterm.nerdfonts.seti_go,
	["python3"] = "",
	["zsh"] = wezterm.nerdfonts.dev_terminal,
	["bash"] = wezterm.nerdfonts.cod_terminal_bash,
	["btm"] = wezterm.nerdfonts.mdi_chart_donut_variant,
	["htop"] = wezterm.nerdfonts.mdi_chart_donut_variant,
	["cargo"] = wezterm.nerdfonts.dev_rust,
	["sudo"] = wezterm.nerdfonts.fa_hashtag,
	["lazydocker"] = wezterm.nerdfonts.linux_docker,
	["git"] = wezterm.nerdfonts.dev_git,
	["lua"] = wezterm.nerdfonts.seti_lua,
	["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
	["curl"] = wezterm.nerdfonts.mdi_flattr,
	["gh"] = wezterm.nerdfonts.dev_github_badge,
	["ruby"] = wezterm.nerdfonts.cod_ruby,
}

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane and tab.active_pane.current_working_dir or { file_path = "" }
	local HOME_DIR = os.getenv("HOME")

	return current_dir.file_path == HOME_DIR and "~" or string.gsub(current_dir.file_path, "(.*[/\\])(.*)", "%2")
end

local function get_process(tab)
	if not tab.active_pane or tab.active_pane.foreground_process_name == "" then
		return nil
	end

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
	if string.find(process_name, "kubectl") then
		process_name = "kubectl"
	end

	return process_icons[process_name] or string.format("[%s]", process_name)
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_with)

	local cwd = wezterm.format({
		{ Text = get_current_working_dir(tab) },
	})

	local process = get_process(tab)
	local title = process and string.format(" %s (%s) ", process, cwd) or " [?] "
    local foreground = colors.foreground
    if tab.is_active then
        foreground = colors.selection_fg
    end

	return {
		{ Foreground = { Color = foreground  } },
		{ Background = { Color = colors.tab_bar.background } },
		{ Text = title },
	} 
end)

return {
	enable_wayland = false,
	animation_fps = 60,
	max_fps = 60,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1],

	colors = colors,
    command_palette_rows = 10,
    command_palette_fg_color = colors.selection_fg,
    command_palette_bg_color = colors.background,
	background = {
		{
			source = { Color = colors.background },
			height = "100%",
			width = "100%",
			opacity = 0.90,
		},
	},

    window_frame = {
        font = wezterm.font("FiraCode Nerd Font", { weight = 450 }), 
        border_left_color = colors.selection_fg,
        border_right_color = colors.selection_fg,
        border_bottom_color = colors.selection_fg,
        border_top_color = colors.selection_fg,
    },

	tab_bar_at_bottom = true,
    show_new_tab_button_in_tab_bar = false,

	use_fancy_tab_bar = false,
	enable_scroll_bar = true,
}
