vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false

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

--vim.opt.number = true
--vim.opt.relativenumber = true

vim.opt.inccommand = "split"

vim.opt.cursorline = false

vim.opt.tabstop = 4

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>x", ":%s/\\(\\s\\)\\+$//g<CR> ``", { silent = true })

vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("v", "j", "gj", { silent = true })
vim.keymap.set("v", "k", "gk", { silent = true })

vim.keymap.set("n", "<leader>v", "<C-W><C-V><C-W><C-L>")
vim.keymap.set("n", "<leader>s", "<C-W><C-S>")
vim.keymap.set("n", "<leader>q", "<C-W><C-Q>")

vim.keymap.set("n", "<leader>cn", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>cp", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "<leader>cq", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>cw", ":cwindow<CR>", { silent = true })

vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

vim.keymap.set("v", "<TAB>", ">gv", { silent = true })
vim.keymap.set("v", "<S-TAB>", "<gv", { silent = true })

vim.keymap.set("n", "<leader>tt", "<C-]>")

-- yank current file full path to system clipboard
vim.keymap.set("n", "<leader>yf", ':let @+ = expand("%:p", { silent = true })<CR>')
-- yank current file relative path to system clipboard
vim.keymap.set("n", "<leader>yr", ':let @+ = expand("%", { silent = true })<CR>')

vim.keymap.set("n", "å", "{")
vim.keymap.set("n", "ö", "}")
vim.keymap.set("x", "å", "{")
vim.keymap.set("x", "ö", "}")

-- C-S to save
vim.keymap.set("n", "<C-S>", ":w<CR>")

function ClearBg()
  vim.cmd.hi("Normal guibg=NONE ctermbg=NONE")
end

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "tpope/vim-sleuth",
  "tpope/vim-fugitive",
  "tpope/vim-surround",

  "nanotech/jellybeans.vim",

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  -- {
  --   "folke/todo-comments.nvim",
  --   event = "VimEnter",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   opts = { signs = false },
  -- },

  -- shows function signature while typing
  -- "hrsh7th/cmp-nvim-lsp-signature-help",

  -- The import below can automatically adds plugins from e.g. `lua/custom/plugins/*.lua`
  { import = "roju.plugins" },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

vim.g.jellybeans_overrides = {
  background = {
    ["ctermbg"] = "none",
    ["256ctermbg"] = "none",
    ["guibg"] = "none",
  }
}

vim.cmd.colorscheme("jellybeans")
--ClearBg()

