vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>")

vim.keymap.set("n", "<leader>bn", vim.cmd.bnext)
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious)

-- remove highlight after search
vim.keymap.set("n", "<C-c>", vim.cmd.nohl)

vim.keymap.set("v", "<leader>p", "\"_dP")

-- vim.keymap.set("n", "<leader>d", "vim.diagnostic.open_float())

vim.keymap.set("n", "<A-f>", "f ")
vim.keymap.set("n", "<A-F>", "F ")

-- emacs hydra-like visual movement
-- this is silly but damn I love it
vim.keymap.set("x", "f", function()
  local char = vim.fn.getcharstr()
  vim.cmd("normal! f" .. char .. "O")
end, { noremap = true })

-- local ebind = function (bind) return "O"..bind.."O" end

-- vim.keymap.set("x", "<A-f>", ebind("f "))
-- vim.keymap.set("x", "<A-F>", ebind("F "))
--
-- vim.keymap.set("x", "<A-w>", ebind("w"))
-- vim.keymap.set("x", "<A-W>", ebind("W"))
-- vim.keymap.set("x", "<A-e>", ebind("e"))
-- vim.keymap.set("x", "<A-E>", ebind("E"))
-- vim.keymap.set("x", "<A-b>", ebind("b"))
-- vim.keymap.set("x", "<A-B>", ebind("B"))
