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

nnoremap <leader>v <C-W><C-V><C-W><C-L>
nnoremap <leader>q <C-W><C-Q>

nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>cq :cclose<CR>
nnoremap <leader>cw :cwindow<CR>

nnoremap <leader>t <C-]>

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'

Plug 'morhetz/gruvbox'
call plug#end()

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

nmap <silent> <leader>p <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>n <Plug>(coc-diagnostic-next)

nnoremap <silent> <leader>o :CocList outline<cr>
nnoremap <silent> <leader>s :CocList symbols<CR>

nnoremap <silent> <leader>so :CocCommand clangd.switchSourceHeader<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" <cr> to accept completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" <cr> to accept first completion if nothing selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" tab and s-tab to move in completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif
