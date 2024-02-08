return {
    "tpope/vim-fugitive",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
}
