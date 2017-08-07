set background=dark
set guioptions-=T
set guioptions-=L
set guioptions-=e
"set guioptions-=m
"set guioptions-=r

set lines=40
set columns=120

if has('win32')               " set the gui font
	"set guifont=Lucida_Console:h9
	"set guifont=Consolas:h10
	"set guifont=ProggySquareTT:h12:cANSI
	set guifont=Terminus\ (TTF):h12,Consolas:h10
else
	set guifont=Monospace\ 9
endif
