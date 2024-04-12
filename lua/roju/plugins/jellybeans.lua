return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  "nanotech/jellybeans.vim",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.g.jellybeans_overrides = {
      background = {
        ["guibg"] = "202020",
        ["ctermbg"] = "none",
        ["256ctermbg"] = "none",
      },
    }

    vim.cmd.colorscheme("jellybeans")

    -- You can configure highlights by doing something like:
    -- vim.cmd.hi "Comment gui=none"
    vim.cmd.hi("SignColumn guibg=NONE")
    vim.cmd.hi("SignColumn ctermbg=NONE")
  end,
}
