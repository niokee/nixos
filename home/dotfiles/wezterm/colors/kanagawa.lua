local dragon = {
	sumInk0 = "#16161D",
	sumInk1 = "#181820",
	sumInk2 = "#1A1A22",
	sumInk3 = "#1F1F28",

	fujiGrey = "#727169",

	fujiWhite = "#DCD7BA",
	oldWhite = "#C8C093",

	waveBlue = "#2D4F67",
	springBlue = "#7FB4CA",
	crystalBlue = "#7E9CD8",
	winterBlue = "#252535",
	lightBlue = "#A3D4D5",

	waveAqua1 = "#6A9589",
	waveAqua2 = "#7AA89F",

	oniViolet = "#957FB8",
	springViolet = "#938AA9",
	dragonViolet = "#8992a7",

	boatYellow1 = "#C0A36E",
	carpYellow = "#E6C384",

	surimiOrange = "#FFA066",

	autumnRed = "#C34043",
	samuraiRed = "#E82424",
	peachRed = "#FF5D62",

	sakuraPink = "#D27E99",

	springGreen = "#98BB6C",

	lotusCyan = "#D7E3D8",
	idk = "#C9D87E",
	transparent = "rgba(0,0,0,0)",
}

local colorsheme = {
	foreground = dragon.fujiWhite,
	background = dragon.sumInk3,
	cursor_fg = dragon.oldWhite,
	cursor_border = dragon.oldWhite,
	cursor_bg = dragon.fujiGrey,
	selection_bg = dragon.waveBlue,
	selection_fg = dragon.oldWhite,
	tab_bar = {
		background = dragon.transparent,
		new_tab = {
			bg_color = dragon.transparent,
			fg_color = dragon.transparent,
		},
		new_tab_hover = {
			bg_color = dragon.transparent,
			fg_color = dragon.transparent,
			italic = false,
		},
	},
	ansi = {
		dragon.sumInk0,
		dragon.autumnRed,
		dragon.idk,
		dragon.boatYellow1,
		dragon.crystalBlue,
		dragon.oniViolet,
		dragon.waveAqua1,
		dragon.oldWhite,
	},

	brights = {
		dragon.fujiGrey,
		dragon.samuraiRed,
		dragon.springGreen,
		dragon.carpYellow,
		dragon.springBlue,
		dragon.springViolet,
		dragon.waveAqua2,
		dragon.fujiWhite,
	},
}
return colorsheme
