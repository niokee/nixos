return {
    {
        "PedramNavid/dbtpal",
        config = function()
            local dbt = require("dbtpal")
            dbt.setup({
                path_to_dbt = "dbt",
                path_to_dbt_project = "", -- auto-detect
                path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
            })
            vim.keymap.set("n", "<leader>drf", dbt.run)
            vim.keymap.set("n", "<leader>drp", dbt.run_all)
            vim.keymap.set("n", "<leader>dtf", dbt.test)
            require("telescope").load_extension("dbtpal")
        end,
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
    },
}
