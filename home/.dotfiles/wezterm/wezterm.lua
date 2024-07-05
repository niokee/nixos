local Config = require("config")

return Config:init()
	:append(require("config.appearance"))
	:append(require("config.domains"))
	:append(require("config.fonts"))
	:append(require("config.keybindings"))
    :append(require("config.general"))
	:append(require("config.plugins")).options

