print("huh?")
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.ic = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

-- not sure how I feel about this - I don't like terms remaining highlighted, but this also turns off the terms being highlighted as you cycle through them
vim.opt.hlsearch = false
vim.opt.incsearch = true -- I don't know that this does anything

vim.opt.termguicolors = true -- enables 24-bit color?

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

-- primeagen options - test some of these to see if they're useful
-- vim.opt.smartindent = true
-- undo tree - lets you undo things from a long time ago, although I don't know how to access them - probably the undo tree thing?
-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("mike")








