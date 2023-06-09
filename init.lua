vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use {'dracula/vim', as = 'dracula'}
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'AndrewRadev/linediff.vim'        -- Visual select and :Linediff
  use 'AndrewRadev/splitjoin.vim'       -- keys `gS`, `gJ`
  use 'AndrewRadev/deleft.vim'          -- keys `dh`
  use 'tpope/vim-fugitive'              -- :Gdiff :Gblame
  use 'tpope/vim-rhubarb'               -- :Gbrowse
  use 'tpope/vim-repeat'                -- needed for vim-easyclip
  use 'svermeulen/vim-easyclip'         -- yank between vim sessions

  -- React Native
  use 'pangloss/vim-javascript'
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use { 'styled-components/vim-styled-components', branch = 'main' }
  use 'jparise/vim-graphql'

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Snippets
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Copilot
  use 'github/copilot.vim'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use {
    'RutaTang/spectacle.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  }

  -- Icons
  use 'ryanoasis/vim-devicons' -- NERDTree likes these
  use 'nvim-tree/nvim-web-devicons' -- Telescope likes these

  -- Status line
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

  -- Comments
  use 'numToStr/Comment.nvim'

  -- TEMP
  use 'sindrets/diffview.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'habamax/vim-godot'

  -- DEV
  -- use {
  --   'enclaver/spectacle.nvim',
  --   branch = 'enclaver/create-dir-on-save',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim'
  --   }
  -- }

  --use 'vim-ruby/vim-ruby' -- Disabled for now

  require('std_config')
  require('colorscheme_config')
  require('ruby_config')
  require('nerd_tree_config')
  require('easy_clip_config')
  require('lsp_config')
  require('cmp_config')
  require('telescope_config')
  require('lualine_config')
  require('gitsigns_config')

  require('Comment').setup{}

  vim.api.nvim_set_keymap('n', '<leader>sq', '<cmd>:lua require("spectacle").SpectacleTelescope()<cr>',{})
  vim.api.nvim_set_keymap('n', '<leader>ss', '<cmd>:lua require("spectacle").SpectacleSave()<cr>',{})
  vim.api.nvim_set_keymap('n', '<leader>sa', '<cmd>:lua require("spectacle").SpectacleSaveAs()<cr>',{})
end)
