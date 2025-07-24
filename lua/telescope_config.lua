local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
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
    },
    git_stash = {
      mappings = {
        i = {
          ["<M-w>"] = function(prompt_bufnr)
            local entry = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if entry and entry.value then
              vim.fn.system({ "git", "stash", "drop", entry.value })
              print("Deleted stash:", entry.value)
            else
              print("No stash selected.")
            end
          end,
        },
      },
    },
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
    },
    layout_config = {
      horizontal = {
        width = 0.95,
        height = 0.95,
        preview_width = 0.6,
      },
      vertical = {
        width = 0.95,
        height = 0.95,
        preview_height = 0.6,
      },
    },
    -- layout_strategy = 'vertical',
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
