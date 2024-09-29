vim.opt.mouse = "a"

vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

vim.opt.showmode = false
vim.opt.number = false

-- vim.opt.breakindent = true
-- vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "no"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.backspace = "indent,eol,start"

vim.opt.splitright = true
vim.opt.splitbelow = false

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.showbreak = "\\"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.inccommand = "split"

vim.opt.cursorline = false

vim.opt.tabstop = 4

vim.opt.hlsearch = true
