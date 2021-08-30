" loading this file assumes that you have vim plugged installed

" options for some optional plugins
if !exists("g:load_coc")
  let g:load_coc=0
endif
if !exists("g:load_fzf")
  let g:load_fzf=0
endif
if !exists("g:load_multicursor")
  let g:load_multicursor=1
endif
if !exists("g:load_anyjump")
  let g:load_anyjump=1
endif

call plug#begin('~/.config/vim/plugged')
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-commentary'

  Plug 'liuchengxu/vim-which-key'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'ton/vim-alternate'

  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'PhilRunninger/nerdtree-visual-selection'
  "" Could be cool, but needs special font, so needs some setup'
  "" Probably at least add as optional plugin
  " Plug 'ryanoasis/vim-devicons'

  Plug 'vim-airline/vim-airline'

  if g:load_multicursor
    Plug 'mg979/vim-visual-multi'
  endif

  if g:load_coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
  else
    Plug 'rhysd/vim-clang-format'
  endif

  if g:load_anyjump
    Plug 'pechorin/any-jump.vim'
  endif

  if g:load_fzf
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
  else
    Plug 'kien/ctrlp.vim'
    Plug 'jremmen/vim-ripgrep'
  endif

  Plug 'neoclide/jsonc.vim'
  Plug 'ziglang/zig.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'posva/vim-vue'
  Plug 'tikhomirov/vim-glsl'

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

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

set foldlevel=99 " Open all folds

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
    let b:preferred_searcher = 'rg'
endif

if g:load_fzf && executable('fzf')
    nnoremap <C-P> :Files<CR>
endif

nnoremap <leader>s :Rg <C-R><C-W><CR>

if !g:load_coc
  " clang-format binds
  autocmd FileType c,cpp,objc nnoremap <silent><buffer><Leader>f :<C-u>ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <silent><buffer><Leader>f :ClangFormat<CR>
endif

autocmd! BufNewFile,BufRead *.vs,*.fs,*.frag,*.vert,*.glsl set ft=glsl

" ---- Coc config
if g:load_coc
  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> <leader>dp <Plug>(coc-diagnostic-prev)
  nmap <silent> <leader>dn <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " coc-git binds
  nmap <silent> <leader>gs <Plug>(coc-git-chunkinfo)
  nmap <silent> <leader>gn <Plug>(coc-git-nextchunk)
  nmap <silent> <leader>gp <Plug>(coc-git-prevchunk)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f <Plug>(coc-format-selected)
  " Format entire document
  nmap <leader>f <Plug>(coc-format)

  " Using vim-alternate as a replacement for this
  " nnoremap <leader>so :CocCommand clangd.switchSourceHeader<CR>

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " List actions
  nmap <silent><leader>la  :CocList actions<CR>

  " Apply AutoFix to problem on the current line.
  nmap <leader>lf  <Plug>(coc-fix-current)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Mappings for CocList
  nnoremap <silent><nowait> <space>ld  :<C-u>CocList diagnostics<cr>
  nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
  nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
  nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
  nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
  nnoremap <silent><nowait> <space>lj  :<C-u>CocNext<CR>
  nnoremap <silent><nowait> <space>lk  :<C-u>CocPrev<CR>
  nnoremap <silent><nowait> <space>lp  :<C-u>CocListResume<CR>
endif

