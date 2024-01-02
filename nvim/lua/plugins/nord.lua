return {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 99,
  config = function()
    vim.cmd("colorscheme nord")
    vim.g.nord_disable_background = true
  end
}
