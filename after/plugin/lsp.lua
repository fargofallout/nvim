local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)

    lsp_zero.default_keymaps({bufnr = bufnr})

    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    -- nmap("<leader>py", function() require("telescope.builtin").lsp_workspace_symbols({frame_width = 60}) end, "[P]roject [S]ymbols")
    nmap("<leader>py", require("telescope.builtin").lsp_workspace_symbols, "[P]roject S[y]mbols")
    nmap("<leader>dy", require("telescope.builtin").lsp_document_symbols, "[D]ocument S[y]mbols")

    -- nmap("<leader>K", require("telescope.builtin").hover, "[K]elp")

end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {"jedi_language_server", "html"},
    handlers = {
        lsp_zero.defaultsetup,
        jedi_language_server = function()
            require("lspconfig").jedi_language_server.setup({
                settings = {single_file_support=false, completions={fuzzy=true}}
            })
        end,
    },
})

require("lspconfig").html.setup{
    filetypes = {"html", "htmldjango"},
}

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<TAB>"] = cmp.mapping.confirm({select = true}),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
    }),
    matching = { disallow_fuzzy_matching = false,}
})

-- note: jedi has specific requirements to call a collection of files a project
-- there are lsp commands to see some of those settings, including:
-- LspZeroViewConfigSource jedi_language_server [replace the argument with any language server]
-- LspInfo
-- for jedi, it requires requirements.txt, .git, setup.py, and a few others - not main 
