local newfile = require('thecodecafe.newfile')

vim.keymap.set('n', '<C-n>', function ()
  newfile.create()
end)

