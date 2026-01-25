-- New built-in treesitter config (Neovim 0.10+)
vim.treesitter.language.add("c")
vim.treesitter.language.add("lua")
vim.treesitter.language.add("vim")
vim.treesitter.language.add("query")
vim.treesitter.language.add("python")
vim.treesitter.language.add("rust")
vim.treesitter.language.add("go")

-- Highlight and indent are now enabled per-buffer or globally
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local max_filesize = 100 * 1024 -- 100KB
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
