require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "query", "python", "rust", "go" },
    indent = { enable = true },
    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
            local max_filecsize = 100 * 1024 -- 100KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filecsize then
                return true
            end
        end,
    },
})
require("nvim-treesitter.install").compilers = { "clang", "cc" }
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})
