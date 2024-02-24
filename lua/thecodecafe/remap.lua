vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>rp", ":%s/")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>', { noremap = true, silent = true })

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>rn", ":IncRename ")

vim.keymap.set("n", "<leader>qq", function ()
  vim.cmd(":q")
end)

vim.keymap.set("n", "<leader>ww", function ()
  vim.cmd(":w")
end)

vim.keymap.set("n", "<leader>wa", function ()
  vim.cmd(":wa")
end)
