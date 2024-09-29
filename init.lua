vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

require("roju.opts")
require("roju.keymap")
require("roju.misc")
require("roju.lazy")

vim.cmd.colorscheme("catppuccin")
--ClearBg()
