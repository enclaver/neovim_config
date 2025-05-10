local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Find References' })
vim.keymap.set('n', '<leader>fu', builtin.resume, { desc = 'Find Last Used' })
vim.keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Find Git Status' })

vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, { desc = 'Find Git Commits On This File' })
vim.keymap.set('n', '<leader>gC', builtin.git_commits, { desc = 'Find Git Commits' })
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = 'Git Blame' })
vim.keymap.set('n', '<leader>gB', builtin.git_branches, { desc = 'Find Git Branches' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Find Git Status' })
vim.keymap.set('n', '<leader>gS', builtin.git_stash, { desc = 'Find Git Stash' })

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
  defaults = {
    file_ignore_patterns = {
      "%.tres",
      "%.tscn",
      "%.import",
      "%.png",
      "%.glb",
      "%.godot",
      "%.svg",
      "%.fbx",
      "%.uid",
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
