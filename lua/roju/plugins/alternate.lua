return {
  "ton/vim-alternate",
  keys = "<leader>oo",
  config = function()
    vim.keymap.set("n", "<leader>oo", ":Alternate<CR>")
  end,
}
