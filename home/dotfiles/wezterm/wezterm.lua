local Config = require("config")

function detect_host_os()
    -- package.config:sub(1,1) returns '\' for windows and '/' for *nix.
    if package.config:sub(1, 1) == "\\" then
        return "windows"
    else
        -- uname should be available on *nix systems.
        local check = io.popen("uname -s")
        local result = check:read("*l")
        check:close()

        if result == "Darwin" then
            return "macos"
        else
            return "linux"
        end
    end
end

local host_os = detect_host_os()

if host_os == "macos" then
    -- check homebrew binary symlinks on startup.
    Config.set_environment_variables = {
        PATH = "/etc/profiles/per-user/mateusz/bin:/Users/mateusz/.local/scripts:" .. os.getenv("PATH"),
    }
end

return Config:init()
    :append(require("config.appearance"))
    :append(require("config.domains"))
    :append(require("config.fonts"))
    :append(require("config.keybindings"))
    :append(require("config.general")).options
