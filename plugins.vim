" loading this file assumes that you have vim plugged installed

" options for some optional plugins
if !exists("g:load_multicursor")
  let g:load_multicursor=1
endif
if !exists("g:load_anyjump")
  let g:load_anyjump=1
endif

" Any jump seems to have some problems with regex parsing in rg with C++
" so let's keep using ag for now (even though I use rg otherwise)
let g:any_jump_search_prefered_engine="ag"

call plug#begin('~/.config/vim/plugged')
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-commentary'

  Plug 'liuchengxu/vim-which-key'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'ton/vim-alternate'

  Plug 'easymotion/vim-easymotion'

  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'PhilRunninger/nerdtree-visual-selection'
  "" Could be cool, but needs special font, so needs some setup'
  "" Probably at least add as optional plugin
  " Plug 'ryanoasis/vim-devicons'

  Plug 'vim-airline/vim-airline'

  Plug 'chrisbra/Colorizer'

  Plug 'rhysd/vim-clang-format'

  if g:load_multicursor
    Plug 'mg979/vim-visual-multi'
  endif

  if g:load_anyjump
    Plug 'pechorin/any-jump.vim'
  endif

  if has('nvim')
    " nvim specific plugins
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
  else
    " fall back to ctrlp if not using nvim
    Plug 'kien/ctrlp.vim'
  endif

  Plug 'jremmen/vim-ripgrep'


  Plug 'neoclide/jsonc.vim'
  Plug 'ziglang/zig.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'posva/vim-vue'
  Plug 'tikhomirov/vim-glsl'
  Plug 'bfrg/vim-cpp-modern'

  Plug 'morhetz/gruvbox'
  Plug 'nanotech/jellybeans.vim'
  Plug 'jacoborus/tender.vim'
  Plug 'vim-scripts/wombat256.vim'
  Plug 'tomasiser/vim-code-dark'
call plug#end()

let g:gruvbox_bold=0
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_invert_selection=0

let g:jellybeans_overrides = {
\    'background': { 'guibg': '202020', 'ctermbg': 'none', '256ctermbg': 'none' },
\}

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Switch beween header/source
nnoremap <silent><leader>so :Alternate<CR>

nnoremap <leader>nn :NERDTreeFocus<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
    let b:preferred_searcher = 'rg'
endif

" clang-format binds
autocmd FileType c,cpp,objc nnoremap <silent><buffer><leader>f :ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <silent><buffer><leader>f :ClangFormat<CR>

nnoremap <leader>s :Rg <C-R><C-W><CR>

nnoremap <leader>ct :ColorToggle<CR>

autocmd! BufNewFile,BufRead *.vs,*.fs,*.frag,*.vert,*.glsl set ft=glsl

" nvim specific binds
if has('nvim')
    nnoremap <C-P> <cmd>Telescope find_files<cr>
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fc <cmd>Telescope grep_string<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif

