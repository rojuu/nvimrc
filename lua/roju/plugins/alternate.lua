return {
  "ton/vim-alternate",
  lazy = true,
  keys = "<leader>oo",
  config = function()
    vim.keymap.set("n", "<leader>oo", ":Alternate<CR>")
  end,
}
