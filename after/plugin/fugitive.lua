vim.keymap.set('n', '<leader>gs', vim.cmd.Git);

vim.keymap.set('n', '<leader>ga', ":Git add ")

vim.keymap.set('n', '<leader>gc', ":Git commit -m ")

vim.keymap.set('n', '<leader>gm', function()
  vim.cmd(":Git mergetool")
end)

vim.keymap.set('n', '<leader>gp', ":Git push")
