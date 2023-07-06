-- Basic
vim.o.guicursor = "" -- Fix insert mode glitch
vim.wo.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.encoding = "utf-8"
vim.wo.list = true -- Show invisible characters
vim.o.listchars = "tab:$\\,eol:¬"
vim.wo.colorcolumn = "140"
vim.wo.relativenumber = true

-- Fold
vim.wo.foldmethod = 'indent'
vim.wo.foldlevel = 99

-- Split
vim.o.splitbelow = true
vim.o.splitright = true

-- Mapleader
vim.g.mapleader = ';'

-- Map <Space> to 'za' (toggle fold)
vim.api.nvim_set_keymap('n', '<Space>', 'za', { noremap = true, silent = true })
-- Map <leader>j to run Python JSON formatting
vim.api.nvim_set_keymap('n', '<leader>j', ':!python -m json.tool<CR>', { noremap = true, silent = true })
-- Map <leader>x to run xmllint XML formatting
vim.api.nvim_set_keymap('n', '<leader>x', ':!xmllint --format %<CR>', { noremap = true, silent = true })
-- Map <leader>n to clear search highlight
vim.api.nvim_set_keymap('n', '<leader>n', ':noh<CR>', { noremap = true, silent = true })
-- Tabs
vim.api.nvim_set_keymap('n', '<M-,>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-.>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-left>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-right>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-1>', ':tabnext 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-2>', ':tabnext 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-3>', ':tabnext 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-4>', ':tabnext 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-5>', ':tabnext 5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-6>', ':tabnext 6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-7>', ':tabnext 7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-8>', ':tabnext 8<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-9>', ':tabnext 9<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-0>', ':tabnext 0<CR>', { noremap = true, silent = true })

-- Save folds and cursor position
vim.cmd([[
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END
]])

-- Set wrap for vimdiff
vim.o.diffopt = vim.o.diffopt .. ',followwrap'

-- Vertical diffs
vim.o.diffopt = vim.o.diffopt .. ",vertical"
