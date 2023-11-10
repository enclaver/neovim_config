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
-- vim.wo.relativenumber = true

-- Fold
vim.wo.foldmethod = 'indent'
vim.wo.foldlevel = 99

-- Split
vim.o.splitbelow = true
vim.o.splitright = true

-- Map <leader>n to clear search highlight
vim.api.nvim_set_keymap('n', '<leader>n', ':noh<CR>', { noremap = true, silent = true })
-- Tabs
vim.api.nvim_set_keymap('n', '<M-,>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-.>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-left>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-right>', ':tabnext<CR>', { noremap = true, silent = true })

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
