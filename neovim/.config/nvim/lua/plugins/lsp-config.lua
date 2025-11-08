return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "lua_ls" }, -- add more as needed
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      -- Setup each server individually after mason-lspconfig
      local servers = opts.ensure_installed or {}
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = require('blink.cmp').get_lsp_capabilities(),
          -- Add server-specific settings here if needed
        })
        vim.lsp.enable(server)
      end
      -- Buffer-local LSP keymaps on attach
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend("force", { buffer = bufnr }, opts or {})
            vim.keymap.set(mode, lhs, rhs, opts)
          end
          map('n', 'gd', vim.lsp.buf.definition, { desc = "Goto Definition" })
          map('n', 'gr', vim.lsp.buf.references, { desc = "References", nowait = true })
          map('n', 'gI', vim.lsp.buf.implementation, { desc = "Goto Implementation" })
          map('n', 'gy', vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
          map('n', 'gD', vim.lsp.buf.declaration, { desc = "Goto Declaration" })
          map('n', 'K', function() return vim.lsp.buf.hover() end, { desc = "Hover" })
          map('n', 'gK', function() return vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
          map('i', '<c-k>', function() return vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
          map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
          map('n', '<leader>cR', function() Snacks.rename.rename_file() end, { desc = "Rename File" })
          map('n', '<leader>cr', vim.lsp.buf.rename, { desc = "Rename" })
        end,
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
  },
}
