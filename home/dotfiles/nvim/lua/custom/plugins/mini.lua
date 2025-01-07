return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup()
            require("mini.comment").setup()
            require("mini.indentscope").setup({
                draw = {
                    delay = 0,
                    animation = require("mini.indentscope").gen_animation.none(),
                },
            })
            require("mini.move").setup({
                mappings = {
                    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                    left = "<M-n>",
                    right = "<M-o>",
                    down = "<M-e>",
                    up = "<M-i>",

                    -- Move current line in Normal mode
                    line_left = "<M-n>",
                    line_right = "<M-o>",
                    line_down = "<M-e>",
                    line_up = "<M-i>",
                },
            })
            require("mini.pairs").setup()
            require("mini.surround").setup()
            require("mini.splitjoin").setup()
        end,
    },
}
