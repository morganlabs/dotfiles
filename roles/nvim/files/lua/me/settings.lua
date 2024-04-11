vim.g.mapleader = " "
vim.opt.wrap = false

-- Line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Tabstop
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Swapfile
vim.opt.swapfile = false
vim.opt.backup = false

-- Undo
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colours
vim.opt.termguicolors = true

-- Scrolloff
vim.opt.scrolloff = 10

-- Misc.
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
