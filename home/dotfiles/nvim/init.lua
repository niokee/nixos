require("m-dziuba")
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

    require("lazy").setup({
        { import = "plugins" },
    })
    vim.opt.spell = true
    -- Apply colorscheme and nvim opacitya
    local bd_name = "a"
    vim.cmd("colorscheme kanagawa")
    -- ColorMyPencils()
end
