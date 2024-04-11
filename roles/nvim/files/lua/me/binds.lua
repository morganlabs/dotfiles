local set = vim.keymap.set
local defaultOpts = { noremap = true }

local function map(lhs, rhs, opts) set({ 'n', 'i', 'v' }, lhs, rhs, opts or defaultOpts) end
local function nmap(lhs, rhs, opts) set('n', lhs, rhs, opts or defaultOpts) end
local function imap(lhs, rhs, opts) set('i', lhs, rhs, opts or defaultOpts) end
local function xmap(lhs, rhs, opts) set('x', lhs, rhs, opts or defaultOpts) end
local function smap(lhs, rhs, opts) set('s', lhs, rhs, opts or defaultOpts) end
local function vmap(lhs, rhs, opts) set('v', lhs, rhs, opts or defaultOpts) end
local function tmap(lhs, rhs, opts) set('t', lhs, rhs, opts or defaultOpts) end

-- Disable arrow keys
map('<Up>', '<Nop>')
map('<Down>', '<Nop>')
map('<Left>', '<Nop>')
map('<Right>', '<Nop>')

-- Open Ex(plorer)
nmap("<leader>d", vim.cmd.Ex)

-- Copy to/Paste from system clipboard
set({ 'n', 'x' }, 'sy', '"+y')
set({ 'n', 'x' }, 'sp', '"+p')

-- Move lines
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")

-- Append line below to current line and keep cursor in same place with J
nmap('J', 'mzJ`z')

-- Jump up/down page and keep cursor in same place
nmap('<C-u>', '<C-u>zz')
nmap('<C-d>', '<C-d>zz')

-- Keep cursor centred when searching
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- Replace the work I am currently on
nmap('<leader>r', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Make the current file executable
nmap('<leader>x', ':!chmod +x %<CR>', { silent = true })
