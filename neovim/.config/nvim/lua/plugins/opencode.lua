return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for default `toggle()` implementation.
    "folke/snacks.nvim",
  },
  config = function()
    vim.g.opencode_ops = {
      provider = {
        enabled = "snacks",
      },
    }
    vim.o.autoread = true

    vim.keymap.set({ "n", "x" }, "<leader>aa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<leader>ax", function()
      require("opencode").select()
    end, { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "x" }, "<leader>aA", function()
      require("opencode").prompt("@this")
    end, { desc = "Add to opencode" })
    vim.keymap.set({ "n", "t" }, "<leader>ao", function()
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })
  end,
}
