return {{
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
            enable_chat = true,
            tools = {
                language_server = '/home/mdziuba/.nix-profile/bin/codeium_language_server',
            },
        })
    end
}}
