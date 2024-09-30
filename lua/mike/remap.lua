vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- this isn't working, not sure what's up

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Show diagnostic [E]rror message" })

