return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      "nvim-telescope/telescope-fzf-native.nvim",

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = "make",

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require("telescope").setup({
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
      },
      live_grep = {
        file_ignore_patterns = { "node_modules", ".git", ".venv" },
        additional_args = function(_)
          return { "--hidden" }
        end,
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find existing Buffers" })
    vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Find Marks" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find current Word" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by Grep" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find Resume" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Recent Files" })
    vim.keymap.set("n", "<leader>fds", function()
      builtin.lsp_document_symbols({
        symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Property" },
      })
    end, { desc = "Find LSP document Symbols" })
    vim.keymap.set("n", "<leader>f/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "Find in Open Files" })
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        previewer = false,
      }))
    end, { desc = "Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search Git Files" })
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Search Git Commits" })
    vim.keymap.set("n", "<leader>gcf", builtin.git_bcommits, { desc = "Search Git Commits for current File" })
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Search Git Branches" })
    vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Search Git Status (diff view)" })
  end,
}

