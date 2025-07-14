-- Mapleader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use {'dracula/vim', as = 'dracula'}
  use 'AndrewRadev/linediff.vim'        -- Visual select and :Linediff
  use 'AndrewRadev/splitjoin.vim'       -- keys `gS`, `gJ`
  use 'AndrewRadev/deleft.vim'          -- keys `dh`
  use 'tpope/vim-fugitive'              -- :Gdiff :Gblame
  use 'tpope/vim-rhubarb'               -- :Gbrowse
  use 'tpope/vim-repeat'                -- needed for vim-easyclip
  use 'tpope/vim-surround'
  use 'gbprod/substitute.nvim'

  -- Dot Net
  use 'Hoffs/omnisharp-extended-lsp.nvim'

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
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.4' }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use {
    'RutaTang/spectacle.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  }

  -- Icons
  use 'nvim-tree/nvim-web-devicons' -- Telescope likes these

  -- Status line
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

  -- Comments
  use 'numToStr/Comment.nvim'

  -- DBT
  use 'PedramNavid/dbtpal'

  -- TEMP
  use 'sindrets/diffview.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'habamax/vim-godot'

  -- NeoTree
  use {
  'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  }
  vim.api.nvim_set_keymap('n', '`', ':Neotree reveal<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '~', ':Neotree <CR>', { noremap = true })

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  }

  use { 'j-hui/fidget.nvim', tag = 'legacy' }
  require('fidget').setup()

  use 'folke/which-key.nvim'
  require("which-key").setup {}

  use 'vim-test/vim-test'

  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

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
  require('substitute_config')
  require('lsp_config')
  require('cmp_config')
  require('telescope_config')
  require('lualine_config')
  require('gitsigns_config')
  require('treesitter_config')
  require('dbt_config')
  require('test_config')
  require('harpoon_config')

  require('Comment').setup{}

  vim.keymap.set('n', '<leader>sq', '<cmd>:lua require("spectacle").SpectacleTelescope()<cr>', { desc = 'Session Load' })
  vim.keymap.set('n', '<leader>ss', '<cmd>:lua require("spectacle").SpectacleSave()<cr>', { desc = 'Session Save' })
  vim.keymap.set('n', '<leader>sa', '<cmd>:lua require("spectacle").SpectacleSaveAs()<cr>', { desc = 'Session Save As' })

  require("neo-tree").setup({
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          -- auto close
          -- vimc.cmd("Neotree close")
          -- OR
          require("neo-tree.command").execute({ action = "close" })
        end
      },
    },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_by_pattern = {
          "*.uid",
          "*.tscn",
          "*.tres",
          "*.import",
          "*.png",
        },
      },
    },
  })

  vim.g.copilot_settings = { selectedCompletionModel = 'claude-4.0-sonnet' }
end)
