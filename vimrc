" vimrc file
" Author: Kwezilomso Mhaga <kwezimhaga@live.com>

let g:mapleader=' '
nnoremap <SPACE> <NOP>
let s:confdir = split(&runtimepath, ',')[0]
let s:undodir = s:confdir . '/persist/undo'
let s:templatedir = s:confdir . '/templates'

" plug.vim {{{
call plug#begin(s:confdir . '/bundle')
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'https://github.com/rakr/vim-one'
Plug 'https://github.com/OmniSharp/omnisharp-vim'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/aklt/plantuml-syntax'
Plug 'https://github.com/bling/vim-bufferline'
Plug 'https://github.com/bronson/vim-trailing-whitespace'
Plug 'https://github.com/cespare/vim-toml', {'for': 'toml'}
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/danilo-augusto/vim-afterglow'
Plug 'https://github.com/yorickpeterse/happy_hacking.vim'
Plug 'https://github.com/arcticicestudio/nord-vim'
Plug 'https://github.com/owickstrom/vim-colors-paramount'
Plug 'https://github.com/OrangeT/vim-csharp'
Plug 'https://github.com/danro/rename.vim'
Plug 'https://github.com/davisdude/vim-love-docs', {'for': 'lua'}
Plug 'https://github.com/fatih/vim-go', {'for': 'go'}
Plug 'https://github.com/lifepillar/pgsql.vim', {'for': ['sql', 'psql', 'pgsql']}
Plug 'https://github.com/maralla/completor.vim'
Plug 'https://github.com/martinda/Jenkinsfile-vim-syntax'
Plug 'https://github.com/martingms/vipsql', {'for': ['sql', 'psql', 'pgsql']}
Plug 'https://github.com/owickstrom/vim-colors-paramount'
Plug 'https://github.com/rust-lang/rust.vim', {'for': ['rs', 'rust']}
Plug 'https://github.com/summivox/vim-nfo', {'for': 'nfo'}
Plug 'https://github.com/tbastos/vim-lua', {'for': 'lua'}
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/udalov/kotlin-vim', {'for': ['kt', 'kotlin']}
Plug 'https://github.com/vim-scripts/nginx.vim'
Plug 'https://github.com/vim-utils/vim-man'
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/xtal8/traces.vim'
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/zig-lang/zig.vim'
Plug 'https://github.com/othree/csscomplete.vim'
Plug 'https://github.com/hail2u/vim-css3-syntax'
Plug 'https://github.com/jremmen/vim-ripgrep'
Plug 'https://github.com/PProvost/vim-ps1', {'for': ['ps1', 'powershell']}
Plug 'https://github.com/ron-rs/ron.vim', {'for': 'ron'}

" May install later
"Plug 'https://github.com/lifepillar/vim-mucomplete'
call plug#end()
" }}}
" fundamentals {{{
syntax on                            " turn on syntax highlighting
filetype plugin indent on            " plugins and indentation based on filetype

if !isdirectory(s:undodir)           " undodir in (~/.vim|~/vimfiles)/persist/undo
	call mkdir(s:undodir, 'p')
endif
let &undodir = s:undodir
unlet s:undodir

if has('termguicolors') && !has('gui')    " truecolor in terminal
	if exists('$TMUX')
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif
	set termguicolors
endif

colorscheme nord
set background=dark                  " light background
set backspace=indent,eol,start       " Allow backspacing over everything in insert mode
set completeopt+=noinsert            " don't automatically insert suggestions when typing
set cindent                          " c-style indentation
set noshelltemp                      " not temp files for shell commands
set encoding=utf-8                   " vim encoding to UTF-8
scriptencoding utf-8
set fileencoding=utf-8               " file encoding to UTF-8
if has('win32')
	set fileformat=unix              " default to unix-style line endings
	set fileformats=unix,dos         " preffer unix style line endings
endif
set fillchars=vert:┃,fold:-          " Characters to fill the statuslines and vertical separators.
set foldmethod=marker                " set fold method to match file type
set hlsearch                         " highlight searches
set ignorecase                       " ingore case of search term
set incsearch                        " do incremental searching
set laststatus=2                     " determine when status line should be present
set listchars+=precedes:<,extends:>  " make it easy to identify long lines
set mouse=a                          " enable mouse support
set nobackup                         " somehow backup is set (can't grep source)
set nofoldenable                     " open folds by default
set noswapfile                       " turn off that annoying backup option
set nowrap                           " turn off word wrapping
set number                           " show line numbers
set ruler                            " show cursor position
set scrolloff=3                      " make last\fisrt n lines visible when scrolling
set sessionoptions-=folds            " don't save folds to session file
set sessionoptions-=options          " don't save global or local options in session
set sessionoptions-=curdir           " replace 'curdir'...
set sessionoptions+=sesdir           " ... with 'sesdir'
set shiftwidth=4                     " indent with n spaces
set tabstop=4                        " Number of spaces that a <Tab> in the file counts for.
set noexpandtab                      " Keep tabs
set sidescroll=5                     " make scrolling to the side better
set smartcase                        " ovveride ignorecase if search term has uppercase letter
set splitright                       " make vsplit open window on the right side
set termencoding=utf-8               " terminal encoding to UTF-8
set textwidth=80                     " text width of 80 chars
set ttimeoutlen=50                   " time it takes to return to normal mode
set wildmenu                         " nice completion menu for status bar commands
set wildoptions=pum                  " vertiacl menu for commandline completion
if has('gui')                        " dont map gui menu keys
	set winaltkeys=no
endif
let g:sql_type_default = 'pgsql'
"}}}
" Auto commands {{{
augroup filetypes
	autocmd!
	autocmd BufRead,BufNewFile *.{ad,adoc} set filetype=asciidoc
	autocmd FileType help nnoremap <silent> <buffer> q :bdelete<CR>
	autocmd FileType netrw nnoremap <silent> <buffer> q :bdelete<CR>
	autocmd FileType godoc nnoremap <silent> <buffer> q :bdelete<CR>
	autocmd FileType qf nnoremap <silent> <buffer> q :bdelete<CR>
augroup END

augroup templates
	autocmd!
	autocmd BufNewFile *.{ad,adoc,asciidoc} execute ':0r ' . s:templatedir . '/template.adoc'
	autocmd BufNewFile *.{c} execute ':0r ' . s:templatedir . '/template.c'
augroup END

augroup omnisharp
	autocmd!
	autocmd FileType cs nnoremap <silent> <buffer> gd :OmniSharpGotoDefinition<CR>
	autocmd FileType cs nnoremap <silent> <buffer> <leader>fu :OmniSharpFixUsings<CR>
	autocmd FileType cs nnoremap <silent> <buffer> <leader>t :OmniSharpTypeLookup<CR>
	autocmd FileType cs nnoremap <silent> <buffer> <leader>. :OmniSharpGetCodeActions<CR>
	autocmd FileType cs nnoremap <silent> <buffer> <F4> :w<Bar>term dotnet build<CR>
	autocmd FileType cs nnoremap <silent> <buffer> <F5> :w<Bar>term dotnet run<CR>
	autocmd FileType cs nnoremap <silent> <buffer> <F6> :w<Bar>!dotnet script %<CR>
augroup END

augroup statuscolors
	autocmd!
	autocmd ColorScheme nord call ChangeNordStatuslineColors()
augroup END

" }}}
" Keyboard mappings {{{
inoremap <F2> <Esc>:write<CR>
inoremap <s-f7> <Esc>:make<CR>
inoremap <silent><F7> <Esc>:silent make<CR>
nmap <Leader>k <Plug>(Man)
nmap <Leader>K <Plug>(VMan)
nnoremap <F2> :write<CR>
nnoremap <Leader>B :buffer<Space>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bd :confirm bdelete<CR>
nnoremap <Leader>d :confirm buffer #<Bar>bdelete #<CR>
nnoremap <Leader>i bi
nnoremap <Leader>I Bi
nnoremap <Leader>a ea
nnoremap <Leader>A Ea
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>O O<Esc>j
nnoremap <Left> <<
nnoremap <Right> >>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <silent><F4> :set list!<CR>
nnoremap <silent><Leader>n :nohl<CR>
nnoremap <silent><leader>st :call <SID>statusline_cycle()<cr>
nnoremap Q @@
nnoremap <Leader>p "+p
nnoremap <Leader>y "+y
nnoremap <Leader>P "+P
nnoremap <Leader>Y "+Y
vnoremap <Leader>P "+P
vnoremap <Leader>Y "+Y
vnoremap <Leader>p "+p
vnoremap <Leader>s :sort<CR>
vnoremap <Leader>y "+y

" nvim: Y was changed to y$ (similar to D and C).
" let's revert that change
" https://github.com/neovim/neovim/pull/13268
if has('nvim')
	nnoremap Y Y
endif

" Pane navigation
if has('nvim') || has('gui') || exists('$XTERM_VERSION')
	nnoremap <M-l> <C-w><C-l>
	nnoremap <M-h> <C-w><C-h>
	nnoremap <M-j> <C-w><C-j>
	nnoremap <M-k> <C-w><C-k>
	if has('nvim')
		tnoremap <M-l> <C-\><C-n><C-w><C-l>
		tnoremap <M-h> <C-\><C-n><C-w><C-h>
		tnoremap <M-j> <C-\><C-n><C-w><C-j>
		tnoremap <M-k> <C-\><C-n><C-w><C-k>
	else " either xterm or gvim
		tnoremap <M-l> <C-w><C-l>
		tnoremap <M-h> <C-w><C-h>
		tnoremap <M-j> <C-w><C-j>
		tnoremap <M-k> <C-w><C-k>
	endif
else " assume vim
	nnoremap l <C-w><C-l>
	nnoremap h <C-w><C-h>
	nnoremap j <C-w><C-j>
	nnoremap k <C-w><C-k>
	if has('terminal')
		tnoremap l <C-w><C-l>
		tnoremap h <C-w><C-h>
		tnoremap j <C-w><C-j>
		tnoremap k <C-w><C-k>
	endif
endif
"}}}
" vim-ale plugin {{{
let g:ale_sign_column_always = 1
let g:ale_c_gcc_options = '-std=c17 -Wall -Wextra -Wpedantic'
let g:ale_c_clang_options = '-std=c17 -Wall -Wextra -Wpedantic'
let g:ale_c_clangtidy_checks = ['*', '-llvm-header-guard']
let g:ale_cpp_gcc_options = '-std=c++20 -Wall -Wextra -Wpedantic'
let g:ale_cpp_clang_options = '-std=c++20 -Wall -Wextra -Wpedantic'
let g:ale_cpp_clangtidy_checks = ['*', '-llvm-header-guard']
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_linters = { 'cs': ['OmniSharp'] }
nmap <Leader>al <Plug>(ale_lint)
nmap <Leader>at <Plug>(ale_toggle)
" }}}
" omnisharp-vim {{{
if has('win32')
	let g:OmniSharp_server_path = expand('C:/Applications/omnisharp/OmniSharp.exe')
else
	let g:OmniSharp_server_path = expand('$HOME/opt/omnisharp/OmniSharp')
	let g:OmniSharp_server_use_mono = 0
endif
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
" }}}
" CtrlP {{{
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|obj|pdb|(deps|assets)\.json|nuget\.(g\.(props|targets)|cache))$',
	\ }
" }}}
" completor.vim {{{

let g:completor_cs_omni_trigger = '\w+$|[\w\)\]\}\''\"]+\.\w*$'

" }}}
" statusline {{{
function! s:statusline_mode()
	let l:mode_map = {
		\ '__' : { 'color' : '%1*', 'mode' : ' - '},
		\ 'n'  : { 'color' : '%1*', 'mode' : ' N '},
		\ 'i'  : { 'color' : '%3*', 'mode' : ' I '},
		\ 'R'  : { 'color' : '%3*', 'mode' : ' R '},
		\ 'c'  : { 'color' : '%3*', 'mode' : ' C '},
		\ 'v'  : { 'color' : '%3*', 'mode' : ' V '},
		\ 'V'  : { 'color' : '%3*', 'mode' : ' V '},
		\ '' : { 'color' : '%3*', 'mode' : ' V '},
		\ 's'  : { 'color' : '%3*', 'mode' : ' S '},
		\ 'S'  : { 'color' : '%3*', 'mode' : ' S '},
		\ '' : { 'color' : '%3*', 'mode' : ' S '},
		\ 't'  : { 'color' : '%3*', 'mode' : ' T '},
		\ }

	return l:mode_map[mode()]
endfunction

function! s:sid()
	let l:file = expand('<sfile>')
	return matchstr(l:file, '<SNR>\zs\d\+\ze_SID$')
endfunction

function! s:statusline_gitinfo()
	let l:sym = ''
	if !exists('*fugitive#head')
		return ''
	endif
	let l:branch = fugitive#head()
	if l:branch ==# ''
		return ''
	endif
	return l:sym . l:branch . ' '
endfunction

function! s:statusline_fileinfo()
	let l:encoding = &fileencoding ==# '' ? &encoding : &fileencoding
	return printf('%s %s:%s ', &filetype, l:encoding, &fileformat)
endfunction

function! s:statusline_errors(buffer)
	let l:ale = ale#statusline#Count(a:buffer)
	let l:info = {
		\ 'errors' : l:ale.error + l:ale.style_error,
		\ 'warnings' : 0,
		\ 'total' : l:ale.total
		\ }
	let l:info.warnings = l:info.total - l:info.errors
	return l:info
endfunction

function! s:statusline_cycle()
	let &laststatus = (&laststatus + 1) % 3
	echomsg &laststatus
endfunction

function! s:statusline_aleinfo()
	if !exists('*ale#engine#GetLoclist')
		return ''
	endif
	let l:buffer = buffer_number('%')
	let l:ale = copy(ale#engine#GetLoclist(l:buffer))
	let l:ale = filter(l:ale, { i, v -> v.bufnr ==# l:buffer})
	if empty(l:ale) || empty(l:ale[0])
		return ''
	endif

	let l:errs = filter(copy(l:ale), { i, v -> v.type ==# 'E'})
	let l:warn = filter(copy(l:ale), { i, v -> v.type ==# 'W'})
	let l:info = ''
	if !empty(l:warn)
		let l:info .= printf('%s:%s', l:warn[0].type, l:warn[0].lnum)
	endif
	if !empty(l:errs)
		let l:info .= printf('%s:%s', l:errs[0].type, l:errs[0].lnum)
	endif
	return printf(' %s ', l:info)
endfunction

function! GetStatusLine()
	let l:sid = s:sid()
	let l:mode = s:statusline_mode()

	let l:statusline = l:mode['color']
	let l:statusline .= l:mode['mode']
	let l:statusline .= '%2*'
	let l:statusline .= '%{<SNR>' . l:sid . '_statusline_gitinfo()}'
	let l:statusline .= '%* %n:%t%m'
	let l:statusline .= '%='
	let l:statusline .= '%{<SNR>' . l:sid . '_statusline_fileinfo()}'
	let l:statusline .= '%2*'
	let l:statusline .= ' %l:%c [%p%%] '
	let l:statusline .= '%#Error#'
	let l:statusline .= '%{<SNR>' . l:sid . '_statusline_aleinfo()}'
	return l:statusline
endfunction

function! ChangeNordStatuslineColors()
	highlight VertSplit ctermbg=NONE guibg=NONE
	highlight User1 gui=bold guibg='#cccccc' guifg='#494949'
	highlight User2 gui=NONE guibg='#cccccc' guifg='#494949'
	highlight User3 gui=bold
	highlight StatusLine guifg='#cccccc'
endfunction

" call for the first time
call ChangeNordStatuslineColors()

let &statusline='%!GetStatusLine()'
" }}}
