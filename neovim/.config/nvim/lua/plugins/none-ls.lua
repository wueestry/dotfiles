return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup linters
        null_ls.setup({
            sources = {
                -- python
                formatting.black,
                formatting.isort,
                diagnostics.mypy,

                -- lua
                formatting.stylua,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
