return {
  "junegunn/vim-easy-align",
  keys = "ga",
  config = function()
    vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
    vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
  end,
}
