return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    }, 

    opts = {
        ensure_installed = {
        -- list of lsp servers
            "clangd",
            "lua_ls",
        },
        automatic_installation = true,
    },
}
