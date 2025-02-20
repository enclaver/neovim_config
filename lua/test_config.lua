  vim.cmd([[
    let test#strategy = "neovim_sticky"
    let g:test#neovim_sticky#kill_previous = 1  " Try to abort previous run
    let g:test#preserve_screen = 0  " Clear screen from previous run
    let test#neovim_sticky#reopen_window = 1 " Reopen terminal split if not visible
  ]])
  vim.keymap.set('n', '<leader>tt', '<cmd>:TestNearest<cr>', { desc = 'Test Nearest' })
  vim.keymap.set('n', '<leader>tf', '<cmd>:TestFile<cr>', { desc = 'Test File' })
  vim.keymap.set('n', '<leader>ts', '<cmd>:TestSuite<cr>', { desc = 'Test Suite' })
  vim.keymap.set('n', '<leader>ta', '<cmd>:TestSuite<cr>', { desc = 'Test Suite' })
