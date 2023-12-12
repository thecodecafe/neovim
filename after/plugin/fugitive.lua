vim.keymap.set('n', 'gs', vim.cmd.Git);

vim.keymap.set('n', 'ga', ":Git add ")

vim.keymap.set('n', 'gc', ":Git commit -m ")

vim.keymap.set('n', 'gm', function()
  vim.cmd(":Git mergetool")
end)

vim.keymap.set('n', 'gp', ":Git push")
