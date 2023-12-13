local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
vim.keymap.set("n", "<leader>ps", telescope.live_grep, {})
vim.keymap.set("n", "<leader>8", telescope.grep_string, {})
vim.keymap.set("n", "<leader>pb", telescope.buffers, {})
vim.keymap.set("n", "<leader>ph", telescope.help_tags, {})
vim.keymap.set("n", "<leader>pt", telescope.treesitter, {})
-- other telescope commands can be found here: https://github.com/nvim-telescope/telescope.nvim#pickers

require("telescope").setup {
    defaults = 
    {
        -- people have claimed this makes rg slow - if so, rg will ignore patterns based on .ignore file, or .gitignore if it's a .git directory
        file_ignore_patterns = { "venv*" },
    },
    extensions = {
        fzf = {
            fuzzy = true
        },
    }
}

require("telescope").load_extension("fzf")

-- telescope has fd as an optional dependency, which is a file finder, meant to replace ls
-- I don't think it searches inside of files, so I think it's separate from ripgrep
-- url: https://github.com/sharkdp/fd#installation
