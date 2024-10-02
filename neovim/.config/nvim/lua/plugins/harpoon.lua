return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  keys = {
    {
      "<C-e>",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Harpoon: Toggle Quick Menu",
    },
    {
      "<leader>a",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Harpoon: Add File Mark",
    },

    {
      "<leader>1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Harpoon: Navigate File 1",
    },
    {
      "<leader>2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Harpoon: Navigate File 2",
    },
    {
      "<leader>3",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Harpoon: Navigate File 3",
    },
    {
      "<leader>4",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Harpoon: Navigate File 4",
    },
  },
  --config = function()
  --  local ui = require("harpoon.ui")
  --  --set here, so I can use <leader>li for Mason and <leader>l for Harpoon. Does not work with lazy.nvim `keys` above
  --  -- vim.keymap.set("n", "<leader>l", function() ui.nav_file(3) end)
  --end
}
