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
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- vim.wo.relativenumber = true

-- Escape terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- Fold
vim.wo.foldmethod = 'indent'
vim.wo.foldlevel = 99

-- Split
vim.o.splitbelow = true
vim.o.splitright = true

vim.keymap.set('n', '<leader> ', ':noh<CR>', { desc = 'Clear Search Highlight' })

vim.keymap.set('n', '<M-,>', ':tabprevious<CR>', { desc = 'Previous Tab' })
vim.keymap.set('n', '<M-.>', ':tabnext<CR>', { desc = 'Next Tab' })

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

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.opt.number = true
vim.opt.relativenumber = true

-- Toggle Quickfix List
vim.keymap.set('n', '<leader>q', function()
  local is_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      is_open = true
      break
    end
  end
  if is_open then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end, { noremap = true, silent = true, desc = "Toggle Quickfix List" })

-- Toggle Location List
vim.keymap.set('n', '<leader>w', function()
  local is_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.loclist == 1 then
      is_open = true
      break
    end
  end
  if is_open then
    vim.cmd('lclose')
  else
    vim.cmd('lopen')
  end
end, { noremap = true, silent = true, desc = "Toggle Location List" })
