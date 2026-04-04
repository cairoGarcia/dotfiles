require "remap"
require "dotcolor"
require "html"
require "colorschemes"

local theme = "mono"
local colorscheme = "fleur"

-- local color_bg = dotcolor(theme, "bg")
local color_fg = dotcolor(theme, "fg")

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.guicursor = ""

vim.o.swapfile = false
vim.o.backup = false

vim.o.scrolloff = 100

vim.o.number = true
vim.o.relativenumber = true

-- allow to copy/paste from/to any app
vim.o.clipboard = "unnamedplus"

local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    { src = gh("nvim-telescope/telescope.nvim") },
    { src = gh("nvim-telescope/telescope-media-files.nvim") },
    { src = gh("nvim-lua/plenary.nvim") },
    { src = gh("stevearc/oil.nvim") },

    { src = gh("ryanoasis/vim-devicons") },
    { src = gh("nvim-mini/mini.nvim") },
    { src = gh("akinsho/bufferline.nvim") },

    { src = gh("jake-stewart/multicursor.nvim") },

    { src = gh("fedepujol/move.nvim") },
    { src = gh("numToStr/Comment.nvim") },

    { src = gh("mbbill/undotree") },
    { src = gh("mason-org/mason.nvim") },

    { src = gh("kylechui/nvim-surround") },
    { src = gh("windwp/nvim-autopairs") },
    { src = gh("neovim/nvim-lspconfig") },

    { src = gh("nvim-treesitter/nvim-treesitter") },
    { src = gh("laytan/cloak.nvim") },

    { src = gh("derektata/lorem.nvim") },
    { src = gh("windwp/nvim-ts-autotag") },
})

require("bufferline").setup()

vim.cmd("colorscheme "..colorscheme)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Line", { bg = "none" })
vim.api.nvim_set_hl(0, "VisualLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "signcolumn", { bg = "none" })

vim.o.signcolumn = "no"

vim.cmd('set statusline=%<%f\\ %h%w%m%r%=%(%l,%c%V%)')
vim.cmd(':hi statusline guifg='..color_fg.." guibg='none'")

require("lspconfig")
require("lorem")
require("mason").setup()
require("nvim-surround").setup()
-- require('telescope').load_extension('media_files')

-- bufferline
vim.o.termguicolors = true
vim.o.undofile = true

vim.lsp.enable("lua_ls")
vim.lsp.enable("pylsp")
vim.lsp.enable("hyprls")
vim.lsp.enable("clangd")
vim.lsp.enable("html")
vim.lsp.enable("fish_lsp")
vim.lsp.enable("rust_analyzer")
