-- Show hidden files in NERDTree
vim.g.NERDTreeShowHidden = 1

-- NERDTree key mapping
vim.api.nvim_set_keymap('n', '<Tab>', ':NERDTreeMirror<CR>:NERDTreeFocus<CR>', { noremap = true })

-- Close the tab if NERDTree is the only window remaining in it
vim.cmd([[
  augroup CloseTabWithNERDTree
    autocmd!
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  augroup END
]])

-- Open the existing NERDTree on each new tab
vim.cmd([[
  augroup OpenNERDTreeOnNewTab
    autocmd!
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
  augroup END
]])
