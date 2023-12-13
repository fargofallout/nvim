local harpoon = require("harpoon")
harpoon:setup({
    settings = {
        save_on_toggle = true
    }
})

vim.keymap.set("n", "<leader>s", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)

vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-d>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-f>", function() harpoon:list():next() end)

