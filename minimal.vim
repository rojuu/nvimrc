" barebone setup without plugins or gui
let mapleader=" "

set noswapfile
set nohlsearch
set smartcase
set ignorecase

set autoread
au BufEnter * checktime

set listchars=tab:>-,trail:·,extends:>,precedes:<
set list
set mouse=a
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

" C-] is quite hard to use on nordic kb layout, so rebind that
nnoremap <leader>t <C-]>

nnoremap <leader>th :set hlsearch!<CR>
nnoremap <leader>tn :set number!<CR>

" yank current file full path to system clipboard
nnoremap <leader>yf :let @+ = expand("%:p")<CR>
" yank current file relative path to system clipboard
nnoremap <leader>yr :let @+ = expand("%")<CR>

