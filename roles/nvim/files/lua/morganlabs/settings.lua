vim.g.mapleader = " "

-- Line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Tabstop
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

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
