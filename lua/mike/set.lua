vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.wrap = false

--vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.opt.inccommand = "split" --shows results of replacement as you type?

vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.undofile = true

vim.opt.background = "dark"

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = ".", nbsp = "␣" }

vim.opt.clipboard = "unnamedplus" -- not sure why I added this - to try to fix the external issue on Linux?


-- run files
vim.g.py_file_to_run = ""
vim.keymap.set("n", "<leader>b", function()
    if vim.g.py_file_to_run == "" then
        vim.g.py_file_to_run = vim.split(vim.fn.input "Command to run (e.g., python main.py):", " ")
    end

    local new_buff = vim.api.nvim_create_buf(0, 1)
    vim.api.nvim_command(string.format("botright sb %s", new_buff))
    vim.api.nvim_command("resize 6")
    vim.fn.jobstart(vim.g.py_file_to_run, {
        stdout_buffered = true,
        on_stdout = function(_, data)
            if data then
                vim.api.nvim_buf_set_lines(new_buff, -1, -1, false, data)
            end
        end,
        on_stderr = function(_, data)
            if data then
                vim.api.nvim_buf_set_lines(new_buff, -1, -1, false, data)
            end
        end,
    })
end, {})

vim.keymap.set("n", "<leader>nb", function()
    vim.g.py_file_to_run = vim.split(vim.fn.input "Command to run (e.g., python main.py):", " ")
end, {})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", {clear = true}),
    callback = function()
        vim.highlight.on_yank()
    end,
})


