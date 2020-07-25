" loading this file assumes that you have vim plugged installed

call plug#begin('~/.config/vim/plugged')
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-fugitive'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'jremmen/vim-ripgrep'
  Plug 'liuchengxu/vim-which-key'
  Plug 'vim-airline/vim-airline'

  Plug 'neoclide/jsonc.vim'
  Plug 'ziglang/zig.vim'

  Plug 'rhysd/vim-clang-format'

  Plug 'morhetz/gruvbox'
call plug#end()

" clang-format binds
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

nnoremap <leader>rs :Rg <C-R><C-W>

