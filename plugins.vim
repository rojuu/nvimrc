" loading this file assumes that you have vim plugged installed

call plug#begin('~/.config/vim/plugged')
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'jremmen/vim-ripgrep'
  Plug 'liuchengxu/vim-which-key'
  Plug 'vim-airline/vim-airline'
  Plug 'bounceme/dim-jump'
  Plug 'easymotion/vim-easymotion'
  Plug 'mg979/vim-visual-multi'
  Plug 'pseewald/anyfold'

  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  Plug 'neoclide/jsonc.vim'
  Plug 'ziglang/zig.vim'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'plasticboy/vim-markdown'

  Plug 'rhysd/vim-clang-format'

  Plug 'morhetz/gruvbox'
  Plug 'jnurmine/Zenburn'
  Plug 'sjl/badwolf'
  Plug 'nanotech/jellybeans.vim'
  Plug 'jacoborus/tender.vim'
call plug#end()

" clang-format binds
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

autocmd Filetype * AnyFoldActivate
set foldlevel=99 " Open all folds

if executable('rg')
    " let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
    let b:preferred_searcher = 'rg'
endif

nnoremap <C-P> :Files<CR>

nnoremap <leader>d :DimJumpPos<CR>
nnoremap <leader>s :Rg <C-R><C-W><CR>

