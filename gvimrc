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
		GuiFont! Hack:h12
	else
		set guifont=Hack:h12
	endif
else
	set guifont=Hack\ 12
endif
