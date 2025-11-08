return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost" },
  config = function()
    require("lint").linters_by_ft = {
      lua = { "luacheck" },
      python = { "ruff" },
      -- add more as needed
    }
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
  keys = {
    { "<leader>bl", function() require("lint").try_lint() end, desc = "Lint buffer" },
  },
}
