-- custom test commands: run all tests recursively from current directory
vim.api.nvim_create_user_command("TestAll", function ()
  vim.cmd("!go test -cover ./...")
end, {})
-- custom test commands: run all tests in current file
vim.api.nvim_create_user_command("TestFile", function ()
  require('neotest').run.stop()
  require('neotest').output_panel.clear()
  require('neotest').output_panel.open()
  require('neotest').run.run(vim.fn.expand('%'))
end, {})
-- custom test commands: run the test on the cursor position
vim.api.nvim_create_user_command("TestThis", function ()
  require('neotest').run.stop()
  require('neotest').output_panel.clear()
  require('neotest').output_panel.open()
  require('neotest').run.run()
end, {})

vim.api.nvim_create_user_command("StopTests", function ()
  require("neotest").run.stop()
end, {})

vim.keymap.set("n", "<leader>ta", function ()
  vim.cmd(':TestAll')
end, {desc = 'recursively runs tests from the current directory'})

vim.keymap.set("n", "<leader>tf", function ()
  vim.cmd(':TestFile')
end, {desc = 'runs all tests in the current file'})

vim.keymap.set("n", "<leader>tt", function ()
  vim.cmd(':TestThis')
end, {desc = 'runs the test the cursor is currently on'})

vim.keymap.set("n", "<leader>to", function ()
  require('neotest').output_panel.toggle()
end, {desc = 'runs the test the cursor is currently on'})

vim.keymap.set("n", "<leader>ts", function ()
  require('neotest').summary.toggle()
end, {desc = 'toggles test summary window'})


