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

if has("gui_running")
    " remove useless guis in gvim
    set guioptions-=m  "menu bar
    set guioptions-=T  "toolbar

    set guioptions-=r  "remove right scroll bar
    set guioptions-=L  "remove left scroll bar
endif

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

" no need to rebind esc to caps, this is a more portable solution
inoremap jj <ESC>

nnoremap <leader>v <C-W><C-V><C-W><C-L>
nnoremap <leader>q <C-W><C-Q>

nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>cq :cclose<CR>
nnoremap <leader>cw :cwindow<CR>

nnoremap <leader>t <C-]>

nnoremap <leader>th :set hlsearch!<CR>

call plug#begin('~/.config/vim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'liuchengxu/vim-which-key'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'

Plug 'neoclide/jsonc.vim'
Plug 'ziglang/zig.vim'

Plug 'rhysd/vim-clang-format'

Plug 'morhetz/gruvbox'
call plug#end()

" clang-format bings
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

nnoremap <leader>rs :Rg <C-R><C-W>

