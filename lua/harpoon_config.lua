local harpoon = require('harpoon')
harpoon:setup({
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
    key = function()
        return vim.loop.cwd()
    end,
  },
})

-- -- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end
--
-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })

vim.keymap.set("n", "<M-n>", function() harpoon:list():add() end)
vim.keymap.set("n", "<M-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<M-u>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-i>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-o>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-p>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<M-k>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<M-j>", function() harpoon:list():next() end)
