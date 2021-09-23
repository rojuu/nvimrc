" barebone setup without plugins or gui
let mapleader=" "

set nocompatible
set noswapfile

set mouse=a

set backspace=indent,eol,start

set nohlsearch
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

set listchars=tab:>\ ,trail:-,nbsp:+
set list
set showbreak=\\

augroup filetypedetect
    au BufRead,BufNewFile *.json set filetype=jsonc
augroup END

nnoremap <silent><leader>x :%s/\(\s\)\+$//g<CR> ``

nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

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
nnoremap <leader>t <C-]>

" disable search highlights until next search
nnoremap <silent><leader><leader> :nohls<CR>
nnoremap <silent><leader>h :set hlsearch!<CR>

" yank current file full path to system clipboard
nnoremap <silent><leader>yf :let @+ = expand("%:p")<CR>
" yank current file relative path to system clipboard
nnoremap <silent><leader>yr :let @+ = expand("%")<CR>

