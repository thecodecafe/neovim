local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>s', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })


