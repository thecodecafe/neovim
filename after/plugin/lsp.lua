local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	-- lsp.default_keymaps({buffer = bufnr})

	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set('n', '<leader>vd', function() vim.lsp.buf.open_float() end, opts)
	vim.keymap.set('n', '[d', function() vim.lsp.buf.goto_next() end, opts)
	vim.keymap.set('n', ']d', function() vim.lsp.buf.goto_prev() end, opts)
	vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
	vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

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
    lsp.default_setup,
  },
})

lsp.setup()
