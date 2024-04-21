local module = {}

function module.on_attach(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<Leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<Leader>.', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<Leader>F', function() vim.lsp.buf.format { async = true } end, bufopts)
end

function module.setup()
	require('luasnip.loaders.from_vscode').lazy_load()
	require('mason').setup({ ui = { border = 'single' } })
	local mason_lsp = require('mason-lspconfig')
	mason_lsp.setup()
	mason_lsp.setup_handlers({
		function(server_name)
			local config = {
				on_attach = module.on_attach,
			}
			if server_name == 'lua_ls' then
				config.settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
			end
			require('lspconfig')[server_name].setup(config)
		end
	})
end

return module
