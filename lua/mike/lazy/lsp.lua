return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim", opts = {} },
        -- used to use folke/neodev.nvim here - that github page says to use folke/lazydev.nvim
        -- I think these plugins are used for loading nvim configuration as you make changes? 
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                -- jump to where variable was declared or function was defined
                -- ctrl+t to jump back(?)
                map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

                -- find references for word under cursor
                map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

                -- jump to implementation of word under cursor
                -- this was originally gI rather than gi - not sure why, but noting it here in case it becomes important
                map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

                -- jump to type of word under cursor (e.g., if the var is a string, go to definition of a string?k)
                map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

                -- fuzzily find symbols in buffer
                map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ympols")

                -- same as document symbols, but for whole projects
                map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

                -- selects code action availabe (not sure - maybe used in such cases as when lsp offers to refactor code?)
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                -- pop documentation on word under cursor
                map("K", vim.lsp.buf.hover, "Hover Documentation")

                -- goto declaration (probably more of a C/C++ thing where there are header files)
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

            end
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local servers = {
            gopls = {
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                settings = {
                    gopls = {usePlaceholders = true,},
                },
            },
            jedi_language_server = {
                settings = { diagnostics = { enable = true }}
            },
            html = {},
            lua_ls = {},
        }

        require("mason").setup()
        local ensure_installed = vim.tbl_keys(servers or {})

        require("mason-tool-installer").setup { ensure_installed = ensure_installed }
        require("mason-lspconfig").setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        }
    end
}
