vim.cmd [[
augroup BufferDeletes
	autocmd!
	autocmd FileType help nnoremap <silent> <buffer> q :bdelete<CR>
	autocmd FileType fugitive nnoremap <silent> <buffer> q :bdelete<CR>
	autocmd FileType lspinfo nnoremap <silent> <buffer> q :bdelete<CR>
	autocmd FileType startuptime nnoremap <silent> <buffer> q :bdelete<CR>
	autocmd FileType man nnoremap <silent> <buffer> q :bdelete<CR>
	autocmd FileType netrw nnoremap <silent> <buffer> q :bdelete<CR>
	autocmd FileType godoc nnoremap <silent> <buffer> q :bdelete<CR>
	autocmd FileType qf nnoremap <silent> <buffer> q :bdelete<CR>
augroup END
]]

vim.cmd [[
augroup InsertOnTermOpen
	autocmd!
	autocmd TermOpen * startinsert
augroup END
]]

vim.cmd [[
augroup FileTypes
	autocmd!
	autocmd BufRead,BufNewFile *.{ad,adoc} set filetype=asciidoc
augroup END
]]
