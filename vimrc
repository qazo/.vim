" vimrc file
" Author: Kwezilomso Mhaga <kwezimhaga@live.com>

let g:mapleader=' '
nnoremap <SPACE> <NOP>
let s:confdir = split(&runtimepath, ',')[0]
let s:undodir = s:confdir . '/persist/undo'

" plug.vim {{{
call plug#begin(s:confdir . '/bundle')
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'https://github.com/airblade/vim-gitgutter'
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
Plug 'https://github.com/joonty/vim-do'
Plug 'https://github.com/lifepillar/pgsql.vim', {'for': ['sql', 'psql', 'pgsql']}
Plug 'https://github.com/maralla/completor.vim'
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
Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/xtal8/traces.vim'

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

colorscheme afterglow                " set colorscheme
set background=dark                  " light background
set backspace=indent,eol,start       " Allow backspacing over everything in insert mode
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
set laststatus=1                     " determine when status line should be present
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
let g:sql_type_default = 'pgsql'
"}}}
" Auto commands {{{
augroup filetypes
	autocmd!
	autocmd BufRead,BufNewFile *.{ad,adoc} set filetype=asciidoc
	autocmd FileType help nnoremap <silent> <buffer> q :bdelete<cr>
augroup END
" }}}
" Keyboard mappings {{{
inoremap <F2> <Esc>:write<CR>
inoremap <s-f7> <Esc>:make<CR>
inoremap <silent><F7> <Esc>:silent make<CR>
nmap <Leader>k <Plug>(Man)
nmap <Leader>K <Plug>(VMan)
nnoremap <F2> :write<CR>
nnoremap <Leader>A Ea
nnoremap <Leader>I Bi
nnoremap <Leader>O O<Esc>j
nnoremap <Leader>P "+P
nnoremap <Leader>Y "+Y
nnoremap <Leader>a ea
nnoremap <Leader>B :buffer<Space>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>i bi
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>p "+p
nnoremap <Leader>y "+y
nnoremap <Left> <<
nnoremap <Right> >>
nnoremap <S-F7> :make<CR>
nnoremap <S-Tab> :tabnext<CR>
nnoremap <Tab> :tabprevious<CR>
nnoremap <silent><F4> :set list!<CR>
nnoremap <silent><F7> :silent make<CR>
nnoremap <silent><Leader>n :nohl<CR>
nnoremap Q @@
nnoremap <Leader>d :b#<Bar>bd#<CR>
vnoremap <Leader>P "+P
vnoremap <Leader>Y "+Y
vnoremap <Leader>p "+p
vnoremap <Leader>s :sort<CR>
vnoremap <Leader>y "+y
"}}}
" vim-ale plugin {{{
let g:ale_sign_column_always = 1
let g:ale_c_gcc_options = '-std=c11 -Wall -Wextra -Wpedantic'
let g:ale_c_clang_options = '-std=c11 -Wall -Wextra -Wpedantic'
let g:ale_c_clangtidy_checks = ['*', '-llvm-header-guard']
let g:ale_cpp_gcc_options = '-std=c++14 -Wall -Wextra -Wpedantic'
let g:ale_cpp_clang_options = '-std=c++14 -Wall -Wextra -Wpedantic'
let g:ale_cpp_clangtidy_checks = ['*', '-llvm-header-guard']
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
nmap <Leader>al <Plug>(ale_lint)
nmap <Leader>at <Plug>(ale_toggle)

" }}}
