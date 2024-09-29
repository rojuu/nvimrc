-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "dstein64/vim-startuptime",

  "tpope/vim-sleuth",
  "tpope/vim-fugitive",
  "tpope/vim-surround",

  { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },

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
