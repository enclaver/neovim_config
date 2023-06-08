local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'fr', builtin.lsp_references, {})
vim.keymap.set('n', 'fu', builtin.resume, {})

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
