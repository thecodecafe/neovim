local conform = require('conform')

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    go = { { "gofmt" } },
    sql = { "sqlfmt", "pg_format", "sql_formatter" },
    css = { "stylelint" },
    scss = { "stylelint" },
    json = { "deno" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
