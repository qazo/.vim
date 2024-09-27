vim.api.nvim_create_user_command("Cnd",
	function(opts)
		local path = opts.fargs[1];
		if not vim.fn.filereadable(path) then
			vim.fn.mkdir('-p', path)
		end
		vim.fn.chdir(path)
	end,
	{ nargs = 1 }
)
