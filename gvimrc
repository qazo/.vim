set guioptions-=T
set guioptions-=L
set guioptions-=e
set guioptions-=m
"set guioptions-=r

set lines=40
set columns=120

if has('nvim')
	if exists(':GuiTabline')
		GuiTabline 0
	endif
	if exists(':GuiPopupmenu')
		GuiPopupmenu 0
	endif
endif

if has('win32')
	if has('nvim')
		set guifont=Lucida\ Console:h10
	else
		set guifont=Lucida_Console:h10
	endif

	"set guifont=Consolas:h10
	"set guifont=ProggySquareTT:h12:cANSI
	"set guifont=Terminus\ (TTF):h12,Consolas:h10
else
	"set guifont=Terminus\ 10
	set guifont=Monospace\ 10
endif
