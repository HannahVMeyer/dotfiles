" Load general configuration {{{
let s:vim_path = '~/.vim'

exec 'source ' . s:vim_path . '/basic.vim'
" }}}

" Colour scheme -- console specific {{{
set t_Co=256
" }}}

" Behaviour {{{
set title
"set mouse=a

set laststatus=2

let g:vimrplugin_applescript = 0
let g:vimrplugin_vsplit = 1
" }}}
