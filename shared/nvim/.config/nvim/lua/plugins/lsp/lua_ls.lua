return {
    vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        filetype = { "lua" },
        root_markers = { ".luarc.json", "luarc.jsonc" },
    }),
}
