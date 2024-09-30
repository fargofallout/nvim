return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            build = (function()
                if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
                    return
                end
                return "make install_jsregexp"
            end)(),
        },
        "hrsh7th/cmp-nvim-lsp",
        --"hrsh7th/cmp-buffer", --not 100% sure what this does - seems to let you choose a source for your autocomplete?
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"
        luasnip.config.setup {}

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = "menu,menuone,noinsert" },
            mapping = cmp.mapping.preset.insert {
                ["<Right>"] = cmp.mapping.select_next_item(),
                ["<Left>"] = cmp.mapping.select_prev_item(),
                ["<Down>"] = cmp.mapping.confirm { select = true },
                ["<Up>"] = cmp.mapping.abort(),
                -- ["<C-a>"] = cmp.mapping.complete() {} -- not 100% sure what this does and I don't think I need it
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" }, -- I think this will suggest other words from the current buffer, like Sublime does?
            },
        }
    end
}
