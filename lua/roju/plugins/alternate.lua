return {
  "ton/vim-alternate",
  config = function()
    vim.keymap.set("n", "<leader>so", ":Alternate<CR>")
  end,
}
