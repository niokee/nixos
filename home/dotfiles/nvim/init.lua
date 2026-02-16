require("custom")

if not vim.g.vscode then
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
    -- Apply colorscheme and nvim opacitya

    require("lazy").setup({
        { import = "custom/plugins" },
    })

    vim.cmd("colorscheme kanagawa")
end

local lsp_log = vim.fn.stdpath("state") .. "/lsp.log"
local max_size = 1024 * 100 -- 100 KB

vim.defer_fn(function()
    local stat = vim.uv.fs_stat(lsp_log)
    if stat and stat.size > max_size then
        -- Keep last 1000 lines
        local lines = vim.fn.systemlist("tail -n 1000 " .. lsp_log)
        vim.fn.writefile(lines, lsp_log)
    end
end, 0)
