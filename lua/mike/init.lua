require("lazy").setup({

    -- allows for asynchronous lua - presumably a bunch of these other libraries need it
    -- https://github.com/nvim-lua/plenary.nvim
    {"nvim-lua/plenary.nvim"},

    -- quick nav
    -- https://github.com/ThePrimeagen/harpoon
    {"ThePrimeagen/harpoon",
    branch = "harpoon2"},

    -- exposes(?) neovim's tree-sitter, which does things like expose the syntax tree and enable highlighting
    -- https://github.com/nvim-treesitter/nvim-treesitter
    {"nvim-treesitter/nvim-treesitter", build=":TSUpdate", 
    },

    -- fuzzy finder
    -- https://github.com/nvim-telescope/telescope.nvim
    {"nvim-telescope/telescope.nvim"},
    
    -- sorter (according to telescope github page) (note this requires make and cmake, in addition to gcc (which was installed above))
    -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    {"nvim-telescope/telescope-fzf-native.nvim", build='cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'},


    -- comment shortcuts
    -- https://github.com/numtostr/comment.nvim
    {"numToStr/Comment.nvim", opts = {}, lazy = false},

    -- monokai theme
    -- https://github.com/polirritmico/monokai-nightasty.nvim
    {"polirritmico/monokai-nightasty.nvim", lazy=false, priority=1000},

    -- lsp
    -- https://github.com/VonHeikemen/lsp-zero.nvim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},


    })
