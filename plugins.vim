let g:zig_fmt_autosave = 0

call plug#begin('~/.config/vim/plugged')
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

  Plug 'liuchengxu/vim-which-key'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'ton/vim-alternate'

  Plug 'easymotion/vim-easymotion'
  Plug 'junegunn/vim-easy-align'

  Plug 'vim-airline/vim-airline'

  if has('nvim')
    Plug 'stevearc/oil.nvim'
    "Plug 'nvim-lua/plenary.nvim'
    "Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
  endif

  " Language syntax definitions
  Plug 'neoclide/jsonc.vim'
  Plug 'ziglang/zig.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'posva/vim-vue'
  Plug 'tikhomirov/vim-glsl'
  Plug 'beyondmarc/hlsl.vim'
  Plug 'bfrg/vim-cpp-modern'
  Plug 'mxw/vim-jsx'

  " colors
  Plug 'nanotech/jellybeans.vim'
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

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

augroup filetypedetect
    au BufRead,BufNewFile *.json set filetype=jsonc
augroup END

if has('nvim')
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>b <cmd>Telescope buffers<cr>

  lua require("roju.config")
endif


autocmd! BufNewFile,BufRead *.vs,*.fs,*.frag,*.vert,*.glsl set ft=glsl

