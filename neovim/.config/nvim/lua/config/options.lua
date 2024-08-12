local opt = vim.opt


-- Tab / Indentation
opt.tabstop = 4

opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.hlsearch = false

-- Appearance
opt.nu = true

opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "800"
opt.signcolumn = "yes"

-- Behaviour
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")


opt.updatetime = 50
-- folds
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldlevel = 99

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
