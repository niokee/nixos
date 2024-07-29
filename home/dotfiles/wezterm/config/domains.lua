return {
	-- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
	ssh_domains = {
		{
			multiplexing = "None",
			name = "server",
			remote_address = "192.168.1.254:22",
			username = "mdziuba",
			ssh_option = {
				identityfile = "~/.ssh/id_rsa",
			},
		},
	},

	-- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
	wsl_domains = {
		{
			name = "WSL:NixOS",
			distribution = "NixOS",
			username = "mdziuba",
			default_cwd = "/home/mdziuba/",
			default_prog = { "zsh" },
		},
	},
}
