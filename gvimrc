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
		set guifont=Hack:h11
	else
		set guifont=Hack:h11
	endif
else
	set guifont=Hack\ 11
endif
