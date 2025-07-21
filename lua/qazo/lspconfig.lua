local module = {}

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
			require('lspconfig')[server_name].setup(config)
		end
	})
end

return module
