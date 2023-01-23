
local cmp = require('cmp')
local luasnip = require('luasnip')

local cmp_mappings = {
	['<CR>'] = cmp.mapping.confirm({select = true }),
	['<Tab>'] = cmp.mapping.select_next_item(),
	['<S-Tab>'] = cmp.mapping.select_prev_item(),
	['<C-n>'] = cmp.mapping.select_next_item(),
	['<C-p>'] = cmp.mapping.select_prev_item(),
	['<C-Space>'] = cmp.mapping.complete(),
}

local cmp_config = {
	-- completion = {
	-- 	completeopt = 'menu,preview',
	-- 	autocomplete = true,
	-- },
	snippet = {
		expand = function(args) luasnip.lsp_expand(args.body) end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	}),
	mapping = cmp_mappings,
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
}

local module = {}
module.setup = function()
	cmp.setup(cmp_config)
end
return module
