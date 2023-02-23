local module = {}

local function configure_omnisharp(client)
	if client.name == "omnisharp" then
		client.server_capabilities.semanticTokensProvider = {
			full = vim.empty_dict(),
			legend = {
				tokenModifiers = { "static_symbol" },
				tokenTypes = {
					"comment",
					"excluded_code",
					"identifier",
					"keyword",
					"keyword_control",
					"number",
					"operator",
					"operator_overloaded",
					"preprocessor_keyword",
					"string",
					"whitespace",
					"text",
					"static_symbol",
					"preprocessor_text",
					"punctuation",
					"string_verbatim",
					"string_escape_character",
					"class_name",
					"delegate_name",
					"enum_name",
					"interface_name",
					"module_name",
					"struct_name",
					"type_parameter_name",
					"field_name",
					"enum_member_name",
					"constant_name",
					"local_name",
					"parameter_name",
					"method_name",
					"extension_method_name",
					"property_name",
					"event_name",
					"namespace_name",
					"label_name",
					"xml_doc_comment_attribute_name",
					"xml_doc_comment_attribute_quotes",
					"xml_doc_comment_attribute_value",
					"xml_doc_comment_cdata_section",
					"xml_doc_comment_comment",
					"xml_doc_comment_delimiter",
					"xml_doc_comment_entity_reference",
					"xml_doc_comment_name",
					"xml_doc_comment_processing_instruction",
					"xml_doc_comment_text",
					"xml_literal_attribute_name",
					"xml_literal_attribute_quotes",
					"xml_literal_attribute_value",
					"xml_literal_cdata_section",
					"xml_literal_comment",
					"xml_literal_delimiter",
					"xml_literal_embedded_expression",
					"xml_literal_entity_reference",
					"xml_literal_name",
					"xml_literal_processing_instruction",
					"xml_literal_text",
					"regex_comment",
					"regex_character_class",
					"regex_anchor",
					"regex_quantifier",
					"regex_grouping",
					"regex_alternation",
					"regex_text",
					"regex_self_escaped_character",
					"regex_other_escape",
				},
			},
			range = true,
		}
	end
end
function module.on_attach(client, bufnr)
	if client.name == "omnisharp" then
		configure_omnisharp(client)
	end
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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
	vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
return module
