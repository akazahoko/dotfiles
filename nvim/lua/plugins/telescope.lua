return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>fs", "<cmd>Telescope find_files<cr>" },
    }
}
