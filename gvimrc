set background=dark         " light background
set guioptions-=T             " remove toolbar from gui
set guioptions-=L             " remove left scrollbar from gui
set guioptions-=e             " use nice terminal-style tabs
"set guioptions-=m            " remove menu bar, now wee'z 1337
"set guioptions-=r            " remove right scroll bar

set lines=40
set columns=120

if has('win32')               " set the gui font
	"set guifont=Lucida_Console:h9
	set guifont=Consolas:h10
	"set guifont=ProggySquareTT:h12:cANSI
else
	set guifont=Monospace\ 9
endif
