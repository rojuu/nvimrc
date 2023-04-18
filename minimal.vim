" barebone setup without plugins or gui
let mapleader=" "

set nocompatible
set noswapfile

set mouse=a

set backspace=indent,eol,start

set smartcase
set ignorecase

set hidden

set belloff=all

filetype plugin on
syntax on

" reloading buffer when changes done
set autoread
" Reload when focus regained (incase someone from outside changed the file)
" In theory FocusGained only exists for gui
au FocusGained,BufEnter * checktime

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set tabstop=4

set listchars=tab:>\ ,trail:-,nbsp:+
" set listchars=tab:�\ ,trail:�,nbsp:+
" set listchars=tab:»\ ,space:·,trail:·,nbsp:+
" set listchars=tab:>\ ,nbsp:+
" set list
set list
set showbreak=\\
" set showbreak=↪
" would be cool to add '↩' at the end of the line as well
" issue for that in neovim: https://github.com/neovim/neovim/issues/4762

augroup filetypedetect
    au BufRead,BufNewFile *.json set filetype=jsonc
augroup END

set foldmethod=indent
set foldlevelstart=99

nnoremap <silent><leader>x :%s/\(\s\)\+$//g<CR> ``

nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <silent>j gj
nnoremap <silent>k gk
vnoremap <silent>j gj
vnoremap <silent>k gk

" no need to rebind esc to caps as this is a more portable solution
" to exit insert mode easily
inoremap jj <ESC>

nnoremap <leader>v <C-W><C-V><C-W><C-L>
nnoremap <leader>q <C-W><C-Q>

nnoremap <silent><leader>cn :cnext<CR>
nnoremap <silent><leader>cp :cprev<CR>
nnoremap <silent><leader>cq :cclose<CR>
nnoremap <silent><leader>cw :cwindow<CR>

vnoremap <silent>< <gv
vnoremap <silent>> >gv

vnoremap <silent><TAB> >gv
vnoremap <silent><S-TAB> <gv

nnoremap <silent><leader>w :w<CR>

" C-] is quite hard to use on nordic kb layout, so rebind that
nnoremap <leader>tt <C-]>

nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprevious<CR>

if has('nvim')
  " for some reason this breaks on vanilla vim?
  nnoremap <silent><ESC> :nohls<CR>:cclose<CR>
endif

" nnoremap <silent>* *``

nnoremap <silent><leader>h :set hlsearch!<CR>

" yank current file full path to system clipboard
noremap <silent><leader>yf :let @+ = expand("%:p")<CR>
" yank current file relative path to system clipboard
nnoremap <silent><leader>yr :let @+ = expand("%")<CR>

noremap <silent><F1> 1gt
noremap <silent><F2> 2gt
noremap <silent><F3> 3gt
noremap <silent><F4> 4gt
noremap <silent><F5> 5gt
noremap <silent><F6> 6gt
noremap <silent><F7> 7gt
noremap <silent><F8> 8gt
noremap <silent><F9> 9gt
noremap <silent><F10> 10gt
noremap <silent><F11> 11gt
noremap <silent><F12> 12gt


if !exists("g:load_custom_color_scheme")
  " allow to disable the colorscheme on platforms where I might not want it
  let g:load_custom_color_scheme=1
endif
if g:load_custom_color_scheme
  "
  " Color scheme
  " ==============================================================================
  "
  " The rest of this file contains my custom light theme for vim
  " parts of it are based on onehalf light: https://github.com/sonph/onehalf
  " Onehalf light is licensed under the following license:
  "   =============
  "   MIT License
  "
  "   Copyright (c) 2019 Son A. Pham <sp@sonpham.me>
  "
  "   Permission is hereby granted, free of charge, to any person obtaining a copy
  "   of this software and associated documentation files (the "Software"), to deal
  "   in the Software without restriction, including without limitation the rights
  "   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  "   copies of the Software, and to permit persons to whom the Software is
  "   furnished to do so, subject to the following conditions:
  "
  "   The above copyright notice and this permission notice shall be included in all
  "   copies or substantial portions of the Software.
  "
  "   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  "   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  "   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  "   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  "   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  "   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  "   SOFTWARE.


  set background=light
  highlight clear
  syntax reset

  let g:colors_name="custom"
  let colors_name="custom"

  let s:black       = { "gui": "#000000", "cterm": "Black" }
  let s:dark_green  = { "gui": "#009900", "cterm": "DarkGreen" }
  let s:white       = { "gui": "#ffffff", "cterm": "White" }

  let s:comment_fg  = { "gui": "#a0a1a7", "cterm": "247" }
  let s:gutter_bg   = { "gui": "#fafafa", "cterm": "231" }
  let s:gutter_fg   = { "gui": "#d4d4d4", "cterm": "252" }
  let s:non_text    = { "gui": "#e5e5e5", "cterm": "252" }

  let s:color_col   = { "gui": "#f0f0f0", "cterm": "255" }

  let s:red         = { "gui": "#e45649", "cterm": "167" }
  let s:green       = { "gui": "#50a14f", "cterm": "71" }
  let s:yellow      = { "gui": "#c18401", "cterm": "136" }
  let s:blue        = { "gui": "#0184bc", "cterm": "31" }
  let s:purple      = { "gui": "#a626a4", "cterm": "127" }
  let s:cyan        = { "gui": "#0997b3", "cterm": "31" }

  let s:selection   = { "gui": "#bfceff", "cterm": "153" }
  let s:vertsplit   = { "gui": "#f0f0f0", "cterm": "255" }

  let s:fg          = s:black
  let s:bg          = s:white

  function! s:h(group, fg, bg, attr)
    if type(a:fg) == type({})
      exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm
    else
      exec "hi " . a:group . " guifg=NONE cterm=NONE"
    endif
    if type(a:bg) == type({})
      exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm
    else
      exec "hi " . a:group . " guibg=NONE ctermbg=NONE"
    endif
    if a:attr != ""
      exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    else
      exec "hi " . a:group . " gui=NONE cterm=NONE"
    endif
  endfun


  " User interface colors {
  call s:h("Normal", s:fg, s:bg, "")

  call s:h("Cursor", s:bg, s:black, "")
  call s:h("CursorColumn", "", s:gutter_bg, "")
  call s:h("CursorLine", "", s:gutter_bg, "")

  call s:h("LineNr", s:black, s:black, "")
  call s:h("CursorLineNr", s:fg, "", "")

  call s:h("DiffAdd", s:green, "", "")
  call s:h("DiffChange", s:yellow, "", "")
  call s:h("DiffDelete", s:red, "", "")
  call s:h("DiffText", s:blue, "", "")

  call s:h("IncSearch", s:bg, s:yellow, "")
  call s:h("Search", s:bg, s:yellow, "")

  call s:h("ErrorMsg", s:fg, "", "")
  call s:h("ModeMsg", s:fg, "", "")
  call s:h("MoreMsg", s:fg, "", "")
  call s:h("WarningMsg", s:red, "", "")
  call s:h("Question", s:purple, "", "")

  call s:h("Pmenu", s:white, s:black, "")
  call s:h("PmenuSel", s:bg, s:blue, "")
  call s:h("PmenuSbar", "", s:black, "")
  call s:h("PmenuThumb", "", s:dark_green, "")

  call s:h("SpellBad", s:red, "", "")
  call s:h("SpellCap", s:yellow, "", "")
  call s:h("SpellLocal", s:yellow, "", "")
  call s:h("SpellRare", s:yellow, "", "")

  call s:h("StatusLine", s:blue, s:black, "")
  call s:h("StatusLineNC", s:comment_fg, s:black, "")
  call s:h("TabLine", s:comment_fg, s:black, "")
  call s:h("TabLineFill", s:comment_fg, s:black, "")
  call s:h("TabLineSel", s:fg, s:bg, "")

  call s:h("Visual", "", s:selection, "")
  call s:h("VisualNOS", "", s:selection, "")

  call s:h("ColorColumn", "", s:color_col, "")
  call s:h("Conceal", s:fg, "", "")
  call s:h("Directory", s:blue, "", "")
  call s:h("VertSplit", s:vertsplit, s:vertsplit, "")
  call s:h("Folded", s:fg, "", "")
  call s:h("FoldColumn", s:fg, "", "")
  call s:h("SignColumn", s:fg, "", "")

  call s:h("MatchParen", s:blue, "", "underline")
  call s:h("SpecialKey", s:fg, "", "")
  call s:h("Title", s:green, "", "")
  call s:h("WildMenu", s:fg, "", "")
  " }


  " Syntax colors {
  " Whitespace is defined in Neovim, not Vim.
  " See :help hl-Whitespace and :help hl-SpecialKey
  call s:h("Whitespace", s:non_text, "", "")
  call s:h("NonText", s:non_text, "", "")
  call s:h("Comment", s:dark_green, "", "")
  call s:h("Constant", s:black, "", "")
  call s:h("String", s:black, "", "")
  call s:h("Character", s:black, "", "")
  call s:h("Number", s:black, "", "")
  call s:h("Boolean", s:black, "", "")
  call s:h("Float", s:black, "", "")

  call s:h("Identifier", s:black, "", "")
  call s:h("Function", s:black, "", "")
  call s:h("Statement", s:black, "", "")

  call s:h("Conditional", s:black, "", "")
  call s:h("Repeat", s:black, "", "")
  call s:h("Label", s:black, "", "")
  call s:h("Operator", s:black, "", "")
  call s:h("Keyword", s:black, "", "")
  call s:h("Exception", s:black, "", "")

  call s:h("PreProc", s:black, "", "")
  call s:h("Include", s:black, "", "")
  call s:h("Define", s:black, "", "")
  call s:h("Macro", s:black, "", "")
  call s:h("PreCondit", s:black, "", "")

  call s:h("Type", s:black, "", "")
  call s:h("StorageClass", s:black, "", "")
  call s:h("Structure", s:black, "", "")
  call s:h("Typedef", s:black, "", "")

  call s:h("Special", s:black, "", "")
  call s:h("SpecialChar", s:black, "", "")
  call s:h("Tag", s:blue, "", "")
  call s:h("Delimiter", s:black, "", "")
  call s:h("SpecialComment", s:black, "", "")
  call s:h("Debug", s:black, "", "")
  call s:h("Underlined", s:black, "", "")
  call s:h("Ignore", s:black, "", "")
  call s:h("Error", s:red, s:gutter_bg, "")
  call s:h("Todo", s:red, "", "")
  " }


  " Plugins {
  " GitGutter
  call s:h("GitGutterAdd", s:green, s:gutter_bg, "")
  call s:h("GitGutterDelete", s:red, s:gutter_bg, "")
  call s:h("GitGutterChange", s:yellow, s:gutter_bg, "")
  call s:h("GitGutterChangeDelete", s:red, s:gutter_bg, "")
  " Fugitive
  call s:h("diffAdded", s:green, "", "")
  call s:h("diffRemoved", s:red, "", "")
  " }


  " Git {
  call s:h("gitcommitComment", s:comment_fg, "", "")
  call s:h("gitcommitUnmerged", s:red, "", "")
  call s:h("gitcommitOnBranch", s:fg, "", "")
  call s:h("gitcommitBranch", s:purple, "", "")
  call s:h("gitcommitDiscardedType", s:red, "", "")
  call s:h("gitcommitSelectedType", s:green, "", "")
  call s:h("gitcommitHeader", s:fg, "", "")
  call s:h("gitcommitUntrackedFile", s:cyan, "", "")
  call s:h("gitcommitDiscardedFile", s:red, "", "")
  call s:h("gitcommitSelectedFile", s:green, "", "")
  call s:h("gitcommitUnmergedFile", s:yellow, "", "")
  call s:h("gitcommitFile", s:fg, "", "")
  hi link gitcommitNoBranch gitcommitBranch
  hi link gitcommitUntracked gitcommitComment
  hi link gitcommitDiscarded gitcommitComment
  hi link gitcommitSelected gitcommitComment
  hi link gitcommitDiscardedArrow gitcommitDiscardedFile
  hi link gitcommitSelectedArrow gitcommitSelectedFile
  hi link gitcommitUnmergedArrow gitcommitUnmergedFile
  " }

  " Fix colors in neovim terminal buffers {
  if has('nvim')
    let g:terminal_color_0 = s:black.gui
    let g:terminal_color_1 = s:red.gui
    let g:terminal_color_2 = s:green.gui
    let g:terminal_color_3 = s:yellow.gui
    let g:terminal_color_4 = s:blue.gui
    let g:terminal_color_5 = s:purple.gui
    let g:terminal_color_6 = s:cyan.gui
    let g:terminal_color_7 = s:white.gui
    let g:terminal_color_8 = s:black.gui
    let g:terminal_color_9 = s:red.gui
    let g:terminal_color_10 = s:green.gui
    let g:terminal_color_11 = s:yellow.gui
    let g:terminal_color_12 = s:blue.gui
    let g:terminal_color_13 = s:purple.gui
    let g:terminal_color_14 = s:cyan.gui
    let g:terminal_color_15 = s:white.gui
    let g:terminal_color_background = s:bg.gui
    let g:terminal_color_foreground = s:fg.gui
  endif
  " }
endif


