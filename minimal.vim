" barebone setup without plugins or gui
let mapleader=" "

set nocompatible
set noswapfile

set mouse=a

set backspace=indent,eol,start

set smartcase
set ignorecase

set hidden

filetype plugin on
syntax on

" reloading buffer when changes done
set autoread
" Reload when focus regained (incase someone from outside changed the file)
" In theory FocusGained only exists for gui
au FocusGained,BufEnter * checktime

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"set listchars=tab:>\ ,trail:-,nbsp:+
set listchars=tab:>\ ,nbsp:+
set list
set showbreak=\\

augroup filetypedetect
    au BufRead,BufNewFile *.json set filetype=jsonc
augroup END

set foldmethod=indent
set foldlevelstart=99

nnoremap <silent><leader>x :%s/\(\s\)\+$//g<CR> ``

nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <silent>j gj
nnoremap <silent>k gk
vnoremap <silent>j gj
vnoremap <silent>k gk

" no need to rebind esc to caps as this is a more portable solution
" to exit insert mode easily
inoremap jj <ESC>

nnoremap <leader>v <C-W><C-V><C-W><C-L>
nnoremap <leader>q <C-W><C-Q>

nnoremap <silent><leader>cn :cnext<CR>
nnoremap <silent><leader>cp :cprev<CR>
nnoremap <silent><leader>cq :cclose<CR>
nnoremap <silent><leader>cw :cwindow<CR>

nnoremap <silent><leader>w :w<CR>

" C-] is quite hard to use on nordic kb layout, so rebind that
nnoremap <leader>tt <C-]>

nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprevious<CR>

nnoremap <silent><ESC> :nohls<CR>:cclose<CR>

nnoremap <silent>* *``

nnoremap <silent><leader>h :set hlsearch!<CR>

" yank current file full path to system clipboard
nnoremap <silent><leader>yf :let @+ = expand("%:p")<CR>
" yank current file relative path to system clipboard
nnoremap <silent><leader>yr :let @+ = expand("%")<CR>

noremap <silent><F1> 1gt
noremap <silent><F2> 2gt
noremap <silent><F3> 3gt
noremap <silent><F4> 4gt
noremap <silent><F5> 5gt
noremap <silent><F6> 6gt
noremap <silent><F7> 7gt
noremap <silent><F8> 8gt
noremap <silent><F9> 9gt
noremap <silent><F10> 10gt
noremap <silent><F11> 11gt
noremap <silent><F12> 12gt

