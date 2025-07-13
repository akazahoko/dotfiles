return {
    "williamboman/mason-lspconfig",
    dependencies = { "williamboman/mason.nvim", opts = {} },
    opts = {
        ensure_installed = {
            -- lsp servers
            "lua_ls",
            "clangd",
        },
        automatic_installation = true,
    }
}
