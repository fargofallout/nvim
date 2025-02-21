vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- this isn't working, not sure what's up

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Show diagnostic [E]rror message" })

-- for navigating files when a telescope list has been pulled into quickfix (or whatever it's called
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- vim.keymap.set("n", "<leader>fm", require "mike.lazy.multigrep")

-- ctrl-d and ctlr-u go down and up half a page - this re-centers the window after doing one of those movements
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- local insert_char = function()
--     local row, col = unpack(vim.api.nvim_win_get_cursor(0))
--     vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, {"()"})
--     vim.api.nvim_win_set_cursor(0, {row, col + 1})
-- end
-- vim.keymap.set("i", "(", insert_char())

-- add closing quote or bracket or whatever when an opening one is typed
-- I'm sure there's a way to make this work in one function rather than four, but eh
vim.keymap.set("i", "(", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, {"()"})
    vim.api.nvim_win_set_cursor(0, {row, col + 1})
    end
)

vim.keymap.set("i", "[", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, {"[]"})
    vim.api.nvim_win_set_cursor(0, {row, col + 1})
    end
)

vim.keymap.set("i", "{", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, {"{}"})
    vim.api.nvim_win_set_cursor(0, {row, col + 1})
    end
)

vim.keymap.set("i", "\"", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, {"\"\""})
    vim.api.nvim_win_set_cursor(0, {row, col + 1})
    end
)
