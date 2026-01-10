vim.opt.guicursor = ""

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.scrolloff = 100

vim.opt.number = true
vim.opt.relativenumber = true

-- allow to copy/paste from/to any app
vim.opt.clipboard = "unnamedplus"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- bufferline
vim.opt.termguicolors = true
vim.opt.undofile = true

local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    { src = gh("derektata/lorem.nvim") },
    { src = gh("jake-stewart/multicursor.nvim") },
    { src = gh("adibhanna/forest-night.nvim") },
    { src = gh("numToStr/Comment.nvim") },
    { src = gh("akinsho/bufferline.nvim") },
    { src = gh("fedepujol/move.nvim") },
    { src = gh("mbbill/undotree") },
    { src = gh("neovim/nvim-lspconfig") },
    { src = gh("mason-org/mason.nvim") },
    { src = gh("nvim-treesitter/nvim-treesitter") },
    { src = gh("windwp/nvim-autopairs") },
    { src = gh("windwp/nvim-ts-autotag") },
})

vim.cmd("colorscheme forest-night")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "Line", { bg = "none" })
vim.api.nvim_set_hl(0, "signcolumn", { bg = "none" })

vim.o.signcolumn = "yes"

vim.cmd('set statusline=%<%f\\ カイロちゃんは最古だ\\ %h%w%m%r%=%-14.(%l,%c%V%)\\ :3\\ %P')
vim.cmd(":hi statusline guifg=#406e69 guibg=#010101")

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
require("bufferline").setup()
require("lorem")
require("mason").setup()

vim.lsp.enable({"lua_ls"},{"html"}, {"rust_analyze"}, {"clangd"})
