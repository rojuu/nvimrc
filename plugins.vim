" loading this file assumes that you have vim plugged installed

call plug#begin('~/.config/vim/plugged')
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'liuchengxu/vim-which-key'
  Plug 'jremmen/vim-ripgrep'
  Plug 'kien/ctrlp.vim'

  Plug 'neoclide/jsonc.vim'
  Plug 'ziglang/zig.vim'
  Plug 'plasticboy/vim-markdown'

  Plug 'rhysd/vim-clang-format'

  Plug 'vim-airline/vim-airline'

  Plug 'morhetz/gruvbox'
  Plug 'nanotech/jellybeans.vim'
  Plug 'jacoborus/tender.vim'
  Plug 'vim-scripts/wombat256.vim'
call plug#end()

" let jellybeans_overrides["background"]["guibg"] = "202020"
" let jellybeans_overrides["background"]["ctermbg"] = "202020"
" let jellybeans_overrides["background"]["256ctermbg"] = "202020"

let g:jellybeans_overrides = {
\    'background': { 'guibg': '202020', 'ctermbg': 'none', '256ctermbg': 'none' },
\}


" clang-format binds
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

set foldlevel=99 " Open all folds

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

nnoremap <leader>s :Rg <C-R><C-W><CR>

