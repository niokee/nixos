local Config = require('config')


return Config:init()
    :append(require("config.plugins"))
    :append(require("config.fonts"))
    :append(require('config.appearance')).options
