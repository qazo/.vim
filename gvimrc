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

if has('nvim')
	GuiFont! Fira Code:h10
	GuiRenderLigatures 1
else
	set guifont=Hack:h10
endif
