local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'fr', builtin.lsp_references, {})
vim.keymap.set('n', 'fu', builtin.resume, {})
vim.keymap.set('n', 'fs', builtin.git_status, {}) -- leaderless binding. It's too useful to be behind a leader key

vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gC', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', {})
vim.keymap.set('n', '<leader>gB', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gS', builtin.git_stash, {})

require('telescope').setup{
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<M-w>"] = "delete_buffer"
        }
      }
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        layout_config = {
          width = 0.8
        }
      }
    }
  }
}

require("telescope").load_extension("ui-select")
