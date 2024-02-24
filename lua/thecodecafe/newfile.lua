local popup = require('plenary.popup')

local M = {}

NewFileWinID = nil
NewFileBufH = nil

local function closeWin()
  vim.api.nvim_win_close(NewFileWinID, true)
  NewFileWinID = nil
  NewFileBufH = nil
end

local function createWin()
  local bufnr = vim.api.nvim_create_buf(false, false)
  local width = 60;
  local height = 10;
  -- pop up window
  local winId, win = popup.create(bufnr, {
    title = "New File",
    highlight = "NewFileTypeWindow",
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
    minwidth = width,
    minheight = height,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  });
  -- set window options
  vim.api.nvim_win_set_option(
    win.border.win_id,
    "winhl",
    "Normal:NewFileBorder"
  )
  -- return window information
  return {
    bufnr = bufnr,
    winId = winId,
  }
end

function M.quit()
  if NewFileWinID ~= nil and vim.api.nvim_win_is_valid(NewFileWinID) then
    closeWin()
  end
end

function M.create()
  -- close open window
  M.quit()
  -- create a new window
  local newWin = createWin();
  NewFileWinID = newWin.winId
  NewFileBufH = newWin.bufnr

  -- add close shortcut to buffer
  vim.api.nvim_buf_set_keymap(
    NewFileBufH,
    "n",
    "<ESC>",
    "<Cmd>lua require('thecodecafe.newfile').quit()<CR>",
    {silent = true}
  )
end

return M
