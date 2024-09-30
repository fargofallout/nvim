return {
	"polirritmico/monokai-nightasty.nvim",
	lazy = false,
	priority = 1000,
	opts = { dark_style_background = "transparent",
	color_headers = false,
	lualine_bold = true,

    on_highlights = function(highlights, colors)
        highlights.TelescopeNormal = {fg = colors.magenta, bg = colors.charcoal }
    end,
	},
    config = function(_, opts)
        vim.opt.cursorline = true
        vim.o.background = "dark"
        require("monokai-nightasty").load(opts)
    end,
}
