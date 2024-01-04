local harpoon = require("harpoon")
harpoon:setup({
    settings = {
        save_on_toggle = true
    }
})

vim.keymap.set("n", "<leader>s", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)

vim.keymap.set("n", "<a-a>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<a-s>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<a-d>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<a-f>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-d>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-f>", function() harpoon:list():next() end)

