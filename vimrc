" vimrc file
" Author: Kwezilomso Mhaga <kwezimhaga@live.com>

let mapleader=" "
nnoremap <SPACE> <NOP>
call plug#begin(split(&runtimepath, ',')[0] . '/bundle')
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/lifepillar/pgsql.vim'
Plug 'https://github.com/danro/rename.vim'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/bling/vim-bufferline'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/fatih/vim-go'
Plug 'https://github.com/bronson/vim-trailing-whitespace'
Plug 'https://github.com/vim-utils/vim-man'
Plug 'https://github.com/summivox/vim-nfo'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'https://github.com/mcandre/Benokai'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/vim-scripts/nginx.vim'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'https://github.com/flazz/vim-colorschemes'
Plug 'https://github.com/joshhartigan/vim-reddit'
Plug 'https://github.com/ryanss/vim-hackernews'
call plug#end()

" fundamentals {{{
syntax on                            " turn on syntax highlighting
filetype on                          " filetype detection
filetype plugin indent on            " plugins and indentation based on filetype
colorscheme PaperColor               " nice colorscheme
set background=light                 " light background
set backspace=indent,eol,start       " Allow backspacing over everything in insert mode
set cindent                          " c-style indentation
set noshelltemp                      " not temp files for shell commands
"set cursorcolumn                     " highlight cursor column
"set cursorline                       " highligh cursor line
set encoding=utf-8                   " vim encoding to UTF-8
set fileencoding=utf-8               " file encoding to UTF-8
set foldmethod=marker                " set fold method to match file type
set hlsearch                         " highlight searches
set ignorecase                       " ingore case of search term
set incsearch                        " do incremental searching
set laststatus=2                     " always show statusline
set listchars+=precedes:<,extends:>  " make it easy to identify long lines
set mouse=a                          " enable mouse support
set nobackup                         " do not create backup files
set nofoldenable                     " open folds by default
set noswapfile                       " turn off that annoying backup option
set nowrap                           " turn off word wrapping
set number                           " show line numbers
"set relativenumber                   " show relative line numbers in hybrid mode
set ruler                            " show cursor position
set scrolloff=5                      " make last\fisrt 5 lines visible when scrolling
set sessionoptions-=folds            " don't save folds to session file
set sessionoptions-=options          " don't save global or local options in session
set shiftwidth=4                     " indent also with 4 spaces
set sidescroll=5                     " make scrolling to the side better
set smartcase                        " ovveride ignorecase if search term has uppercase letter
set splitright                       " make vsplit open window on the right side
set tabstop=4                        " tab width is 4 spaces
set termencoding=utf-8               " terminal encoding to UTF-8
set textwidth=80                     " text width of 80 chars
set ttimeoutlen=50                   " time it takes to return to normal mode
set wildmenu                         " nice completion menu for status bar commands
let g:sql_type_default = 'pgsql'
"}}}
" Auto commands {{{
autocmd BufRead,BufNewFile *.{ad,adoc} set filetype=asciidoc
" }}}
" Keyboard mappings {{{
inoremap <F2> <ESC>:write<CR>
inoremap <silent><F7> <ESC>:silent make<CR>
inoremap <S-F7> <ESC>:make<CR>
nnoremap <DOWN> ddp
nnoremap <F2> :write<CR>
nnoremap <silent><F7> :silent make<CR>
nnoremap <S-F7> :make<CR>
nnoremap <LEADER>A Ea
nnoremap <LEADER>I Bi
nnoremap <LEADER>O O<ESC>j
nnoremap <LEADER>P "+P
nnoremap <LEADER>Y "+Y
nnoremap <LEADER>a ea
nnoremap <LEADER>i bi
nnoremap <LEADER>o o<ESC>k
nnoremap <LEADER>p "+p
nnoremap <LEADER>y "+y
nnoremap <LEFT> <<
nnoremap <RIGHT> >>
nnoremap <S-TAB> :bprevious<CR>
nnoremap <TAB> :bnext<CR>
nnoremap <UP> ddkP
nnoremap <silent><F3> :set relativenumber!<CR>
nnoremap <silent><F4> :set list!<CR>
nnoremap <silent><LEADER>n :nohl<CR>
vnoremap <LEADER>P "+P
vnoremap <LEADER>Y "+Y
vnoremap <LEADER>p "+p
vnoremap <LEADER>s :sort<CR>
vnoremap <LEADER>y "+y
"}}}
" vim-airline plugin {{{
let g:airline_theme = 'papercolor'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extentions#ale#enabled = 1
"}}}
" vim NERDTree plugin {{{
nnoremap <F1> :NERDTreeToggle<CR>
inoremap <F1> <ESC>:NERDTreeToggle<CR>
"}}}
" vim-trailing-whitespace plugin {{{
nnoremap <silent> <F12> :FixWhitespace<CR>
" }}}
