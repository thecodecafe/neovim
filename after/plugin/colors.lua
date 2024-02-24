function ColorMyPencils(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)
end

ColorMyPencils()

-- configs for tokyonight
require("tokyonight").setup({
  style = "moon",
  light_style = "moon",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,
})

-- configs for kanagawa
require('kanagawa').setup({
  compile = false,
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,
  dimInactive = false,
  terminalColors = true,
  colors = {
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },
  theme = "wave",
  background = {
    dark = "wave",
    light = "wave"
  },
})
