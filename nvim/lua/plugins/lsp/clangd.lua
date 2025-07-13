return {
    vim.lsp.config("clangd", {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "h", "hpp" }
    }),
}
