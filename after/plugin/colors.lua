vim.opt.background = "dark"
vim.opt.cursorline = true

require("monokai-nightasty").setup({
    dark_style_background = "transparent",

    color_headers = false,
    lualine_bold = true,

    on_highlights = function(highlights, colors)
        highlights.TelescopeNormal = { fg = colors.magenta, bg = colors.charcoal }
    end,
})

-- vim.api.nvim_set_hl(0, "Visual", { ctermfg=orange, ctermbg=black })
vim.cmd([[colorscheme monokai-nightasty]])

