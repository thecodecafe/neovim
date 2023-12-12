local lsp_zero = require('lsp-zero').preset({})

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_zero.on_attach(function(client, bufnr)
  -- lsp.default_keymaps({buffer = bufnr})

  local opts = {buffer = bufnr, remap = false}

  local keymap = vim.keymap -- for conciseness

  opts.desc = "Go to definition"
  keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  opts.desc = "Show current symbol definition"
  keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  opts.desc = "View workspace symbol"
  keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
  keymap.set('n', '<leader>vd', function() vim.lsp.buf.open_float() end, opts)
  keymap.set('n', '[d', function() vim.lsp.buf.goto_next() end, opts)
  keymap.set('n', ']d', function() vim.lsp.buf.goto_prev() end, opts)
  keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
  keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
  keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
  keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  -- set keybinds
  opts.desc = "Show LSP references"
  keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

  opts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

  opts.desc = "Show LSP definitions"
  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
  opts.desc = "Show LSP implementations"
  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

  opts.desc = "Show LSP type definitions"
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

  opts.desc = "See available code actions"
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  opts.desc = "Smart rename"
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

  opts.desc = "Show buffer diagnostics"
  keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end)

lspconfig.tsserver.setup({capabilities = lsp_capabilities})
lspconfig.rust_analyzer.setup({capabilities = lsp_capabilities})
lspconfig.gopls.setup({capabilities = lsp_capabilities})

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {
    'tsserver',
    'eslint',
    'rust_analyzer',
    'gopls',
    'swift_mesonls',
    'html',
    'cssls',
    'marksman'
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

lsp_zero.setup()
