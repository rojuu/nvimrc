" loading this file assumes that you have vim plugged installed

" options for some optional plugins
if !exists("g:load_multicursor")
  let g:load_multicursor=1
endif
if !exists("g:load_anyjump")
  let g:load_anyjump=0
endif
if !exists("g:load_fzf")
  let g:load_fzf=0
endif
if !exists("g:load_treesitter")
  let g:load_treesitter=0
endif


" Any jump seems to have some problems with regex parsing in rg with C++
" so let's keep using ag for now (even though I use rg otherwise)
" let g:any_jump_search_prefered_engine="ag"
" using a different fork for now
let g:any_jump_search_prefered_engine="rg"

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

  Plug 'vim-airline/vim-airline'

  Plug 'chrisbra/Colorizer'

  "Plug 'rhysd/vim-clang-format'

  if g:load_multicursor
    Plug 'mg979/vim-visual-multi'
  endif

  if g:load_anyjump
    Plug 'artemkin/any-jump.vim' "temporarily at least use this one as it has better rg support
    " Plug 'pechorin/any-jump.vim'
  endif

  if g:load_fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
  else
    " fall back to ctrlp if not using telescope
    Plug 'kien/ctrlp.vim'
  endif

  "Plug 'jremmen/vim-ripgrep'
  "Plug 'rking/ag.vim'

  if g:load_treesitter
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter' " the one above was buggy.. should investigate at some point
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'nvim-treesitter/playground'
  end

  " Language syntax definitions
  Plug 'neoclide/jsonc.vim'
  Plug 'ziglang/zig.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'posva/vim-vue'
  Plug 'tikhomirov/vim-glsl'
  Plug 'beyondmarc/hlsl.vim'
  Plug 'bfrg/vim-cpp-modern'
  Plug 'mxw/vim-jsx'

  " Plug 'sonph/onehalf', { 'rtp': 'vim' }
  " Plug 'morhetz/gruvbox'
  " Plug 'nanotech/jellybeans.vim'
  " Plug 'jacoborus/tender.vim'
  " Plug 'vim-scripts/wombat256.vim'
  " Plug 'tomasiser/vim-code-dark'
call plug#end()

let g:airline#extensions#branch#enabled = 0
let g:airline_symbols_ascii = 1

let g:gruvbox_bold=0
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_invert_selection=0

let g:jellybeans_overrides = {
\    'background': { 'guibg': '202020', 'ctermbg': 'none', '256ctermbg': 'none' },
\}

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Switch beween header/source
nnoremap <silent><leader>so :Alternate<CR>

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

if g:load_fzf
  nnoremap <C-P> :Files<CR>
  nnoremap <leader>b :Buffers<CR>
endif

if has('nvim')
  lua require('config')
endif


