-- New built-in treesitter config (Neovim 0.10+)
require("nvim-treesitter").install({
    "c",
    "lua",
    "vim",
    "query",
    "python",
    "rust",
    "go",
})

-- Highlight and indent are now enabled per-buffer or globally
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local max_filesize = 1024 * 1024 -- 1MB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
        if ok and stats and stats.size > max_filesize then
            return
        end
        pcall(vim.treesitter.start, args.buf)
    end,
})

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})
