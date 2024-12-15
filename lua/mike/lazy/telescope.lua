return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies =
    {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            --build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
            --build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
            build = "make",
            cond = function()
                return vim.fn.executable "make" == 1
            end
        },
        {
            -- sets builtin neovim stuff to use telescope windows
            "nvim-telescope/telescope-ui-select.nvim"
        },
    },
    config = function()
        require("telescope").setup
        {
            extensions = 
            {
                ["ui-select"] = {require("telescope.themes").get_dropdown()}
            },
        }
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")
        -- require("mike/lazy/multigrep").setup()
        --pcall(require("telescope").load_extension, "fzf")
        --pcall(require("telescope").load_extension, "ui-select")

        local builtin = require "telescope.builtin"

        vim.keymap.set("n", "<leader>sg", require "custom.telescope.multigrep")

        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
        vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        -- vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
        vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files ('.' for repeat)" })
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
        vim.keymap.set("n", "<leader>st", builtin.treesitter, { desc = "[S]earch [T]reesitter" })
        vim.keymap.set("n", "<leader>se", builtin.registers, { desc = "[S]earch R[E]gisters" })
        -- vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "[/] fuzzy search" }) --I do like having this, but below is a function to do it in a smaller window

        -- search current buffer in small window
        vim.keymap.set("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = "[/] Fuzzily search in current buffer" })

        -- search only open buffers
        vim.keymap.set("n", "<leader>s/", function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files"
            }
        end, { desc = "[S]earch [/] in Open Files" })

        -- search neovim config
        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files { cwd = vim.fn.stdpath "config" }
        end, { desc = "[S]earch [N]eovim config" })

    end,
}
