local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>grt', "<cmd>Telescope lsp_definitions<CR>", { desc = 'LSP def' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
