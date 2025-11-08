return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      sh = { "shfmt" },
      -- add more as needed
    },
  },
  keys = {
    { "<leader>bf", function() require("conform").format() end, desc = "Format buffer" },
  },
}
