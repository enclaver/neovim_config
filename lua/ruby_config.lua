vim.g.ruby_operators = 1
vim.g.ruby_pseudo_operators = 1
vim.cmd [[autocmd FileType ruby setlocal indentkeys-=.]] -- Don't de-indent on `.`.
