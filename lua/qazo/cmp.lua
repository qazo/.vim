
local cmp = require('cmp')
local luasnip = require('luasnip')

local has_words_before = function()
	local fn = vim.fn
	local col = fn.col('.') -1
	if col == 0 then
		return false
	end
	local result = fn.getline('.'):sub(col, col):match('%s')
	return result
end

local cmp_mappings = {
	['<CR>'] = cmp.mapping.confirm(),
	['<Tab>'] = function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end,
	['<S-Tab>'] = function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end,
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
