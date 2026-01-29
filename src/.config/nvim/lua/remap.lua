vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<leader>bn", vim.cmd.bnext)
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious)

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})

vim.keymap.set("n", "<C-c>", vim.cmd.nohl)
