return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
        window = {
            layout = "vertical",
            width = 0.35,
            relative = "editor",
        }
    },
    keys = {
        {"<leader>cc", "<cmd>CopilotChatToggle<cr>"},
    },
}
