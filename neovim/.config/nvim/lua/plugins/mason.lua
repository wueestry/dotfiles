return {
  "williamboman/mason.nvim",
  --no lazy loading
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {

          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "clangd", -- c/c++ lsp
        "lua_ls", -- lua lsp
        "pyright", -- python lsp
      },

      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- cpp

        -- lua
        "stylua", -- lua formatter

        -- python
        "isort", -- python formatter
        "black", -- python formatter
        "mypy", -- python linter
      },
    })
  end,
}
