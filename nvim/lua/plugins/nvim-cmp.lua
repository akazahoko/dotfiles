return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",         -- lsp server
        "hrsh7th/cmp-buffer",           -- text buffer
        "hrsh7th/cmp-path",             -- filesystem path
        "hrsh7th/cmp-cmdline",          -- cmd line
        "saadparwaiz1/cmp_luasnip",     -- luasnip cmp support
    },

    opts = function(_, opts)
        local cmp = require("cmp")

        opts.snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        }

        return {
            completion = {
                completeopt = "menu,menuone,noinsert,preview"
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer"},
                { name = "path" },
            }),
        }
    end,
}
