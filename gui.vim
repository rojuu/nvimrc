" loading this file assumes you are running a gui

" remove useless toolbars
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar

set guioptions-=r  "remove right scroll bar
set guioptions-=L  "remove left scroll bar

autocmd GUIEnter * set vb t_vb=
