vim.keymap.set('n', '<leader>e', function()
  vim.cmd(":NvimTreeToggle")
end)
vim.keymap.set('n', '<leader>ef', function() 
  vim.cmd(":NvimTreeFocus")
end)

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
