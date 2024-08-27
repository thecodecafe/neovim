local lsp_zero = require('lsp-zero').preset({})

local lspconfig = require('lspconfig')

local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function (client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})

  local opts = {buffer = bufnr, remap = false}

  local keymap = vim.keymap -- for conciseness

  -- set keybinds
  opts.desc = "Go to definition"
  keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts) -- go to definition

  opts.desc = "Show current symbol definition"
  keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts) -- show definition of currently hovered symbol

  opts.desc = "View workspace symbol"
  keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts) -- view workspace symbol

  opts.desc = 'Open float'
  keymap.set('n', '<leader>vd', function() vim.lsp.buf.open_float() end, opts) -- not sure what this does yet 

  opts.desc = 'Go to next definition'
  keymap.set('n', '[d', function() vim.lsp.buf.goto_next() end, opts) -- go to next definition

  opts.desc = 'Go to previous definition'
  keymap.set('n', ']d', function() vim.lsp.buf.goto_prev() end, opts) -- got to previous definition

  opts.desc = 'Code action'
  keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts) -- not sure what code action does 

  opts.desc = 'Load references'
  keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts) -- not sure what this does yet 

  opts.desc = 'Get signature\'s help'
  keymap.set('n', '<C-i>', function() vim.lsp.buf.signature_help() end, opts) -- load help window for signature

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
  keymap.set("n", "[d", function () vim.diagnostic.jump({count = -1, float = true}) end, opts) -- jump to previous diagnostic in buffer

  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", function () vim.diagnostic.jump({count = 1, float = true}) end, opts) -- jump to next diagnostic in buffer

  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

end

lsp_zero.on_attach(on_attach)

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server with plugin
lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["gopls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure markdown server
lspconfig["marksman"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'rust_analyzer',
    'gopls',
    'swift_mesonls',
    'html',
    'cssls',
    'marksman',
    'emmet_ls'
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

lsp_zero.setup()
