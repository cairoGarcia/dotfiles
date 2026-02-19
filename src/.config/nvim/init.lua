require "remap"
require "dotcolor"
require "html"
require "colorschemes"

local theme = "mono"
local colorscheme = "fleur"

local color_bg = dotcolor(theme, "bg")
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
    { src = gh("nvim-lua/plenary.nvim") },

    { src = gh("ryanoasis/vim-devicons") },

    { src = gh("jake-stewart/multicursor.nvim") },

    { src = gh("numToStr/Comment.nvim") },
    { src = gh("fedepujol/move.nvim") },

    { src = gh("mbbill/undotree") },
    { src = gh("mason-org/mason.nvim") },
    { src = gh("windwp/nvim-autopairs") },
    { src = gh("neovim/nvim-lspconfig") },
    { src = gh("nvim-treesitter/nvim-treesitter") },


    { src = gh("derektata/lorem.nvim") },
    { src = gh("windwp/nvim-ts-autotag") },
})

vim.cmd("colorscheme "..colorscheme)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "Line", { bg = "none" })
vim.api.nvim_set_hl(0, "signcolumn", { bg = "none" })

vim.o.signcolumn = "yes"

vim.cmd('set statusline=%<%f\\ カイロちゃんは最古だ\\ %h%w%m%r%=%-14.(%l,%c%V%)\\ :3\\ %P')
vim.cmd(":hi statusline guifg="..color_fg.." guibg="..color_bg)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    end
  end,
})

require("lspconfig")
require("lorem")
require("mason").setup()

-- bufferline
vim.o.termguicolors = true
vim.o.undofile = true

vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("pylsp")
vim.lsp.enable("asm_lsp")
vim.lsp.enable("hyprls")
vim.lsp.enable("clangd")
vim.lsp.enable("html")
