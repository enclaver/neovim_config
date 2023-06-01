require('lualine').setup({
  options = {
    theme = 'dracula',
  },
  sections = {
    lualine_b = {
      {
        'branch',
        fmt = function(str) return str:sub(1,15) end
      },
      {
        'diff',
      },
      {
        'diagnostics',
      },
    },
    lualine_c = {
      {
        'filename',
        fmt = function(str) return vim.fn.expand('%:h') end
      },
      {
        'filename',
        separator = { left = '', right = ''},
        color = {
          fg = '#ffffff',
          bg = '#5f6a8e', -- dracula lightgray
        },
        path = 0,                -- 0: Just the filename
                                 -- 1: Relative path
                                 -- 2: Absolute path
                                 -- 3: Absolute path, with tilde as the home directory
                                 -- 4: Filename and parent dir, with tilde as the home directory
      },
    },
    lualine_x = {
      'filetype'
    }
  }
})
