return {
  "ton/vim-alternate",
  config = function()
    vim.keymap.set("n", "<leader>oo", ":Alternate<CR>")
  end,
}
