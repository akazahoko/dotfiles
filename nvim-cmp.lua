-- autocomplete tool for nvim
-- SEE: https://github.com/hrsh7th/nvim-cmp
-- SEE: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",      -- lazy loading

    dependencies = {
        -- sources (lsp)
        "hrsh7th/cmp-nvim-lsp", 

        -- sources (vim built-in functions)
        "hrsh7th/cmp-buffer",   -- text buffer
        "hrsh7th/cmp-path",     -- path
        "hrsh7th/cmp-cmdline",  -- cmd line
        
        -- source (snippet: LuaSnip)
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- snippet: community collections
        "rafamadriz/friendly-snippets",
    },

    -- configuration for autocomplete

    config = function()
        -- load cmp and luasnip
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- load snippets configurations
        require("luasnip.loaders.from_vscode").lazy_load()

        -- setup for autocomplete 
        cmp.setup({
            completion = {
                -- SEE: vim:h completeopt
                completeopt = "menu, menuone, preview, noselect",   
            },

            snippet = {
                -- configure cmp behavior with snippet engines
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),

                ["<C-Space>"] = cmp.mapping.complete(),  -- show suggestions
                ["<C-e>"] = cmp.mapping.abort(),         -- abort

                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- enter to complete
            }),

            sources = cmp.config.sources({
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "cmdline" }, 
            }),
        })
    end,
}
