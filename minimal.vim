" barebone setup without plugins or gui
let mapleader=" "

set nocompatible
set noswapfile

set mouse=a

set backspace=indent,eol,start

set hlsearch
set smartcase
set ignorecase

set hidden

" reloading buffer when changes done
set autoread
" Reload when focus regained (incase someone from outside changed the file)
" In theory FocusGained only exists for gui
au FocusGained,BufEnter * checktime

set listchars=tab:>-,trail:·,extends:>,precedes:<
set list
set showbreak=\\

augroup filetypedetect
    au BufRead,BufNewFile *.json set filetype=jsonc
augroup END

nnoremap <leader>x :%s/\(\s\)\+$//g<CR> ``

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

nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>cq :cclose<CR>
nnoremap <leader>cw :cwindow<CR>

nnoremap <leader>w :w<CR>

" C-] is quite hard to use on nordic kb layout, so rebind that
nnoremap <leader>t <C-]>

" disable search highlights until next search
nnoremap <silent><leader>h :nohls<CR>
" toggle line numbers
nnoremap <leader>n :set number!<CR>

" yank current file full path to system clipboard
nnoremap <leader>yf :let @+ = expand("%:p")<CR>
" yank current file relative path to system clipboard
nnoremap <leader>yr :let @+ = expand("%")<CR>

