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
	if exists(':GuiFont')
		GuiFont! Fira Code:h10
	endif
	if exists(':GuiRenderLigatures')
		GuiRenderLigatures 1
	endif
else
	set guifont=Hack:h10
endif
