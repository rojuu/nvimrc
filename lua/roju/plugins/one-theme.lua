return {
  "sonph/onehalf",
  config = function(plugin)
    vim.opt.rtp:append(plugin.dir .. "/vim")
    vim.cmd.colorscheme("onehalflight")
    vim.cmd.hi("Normal guibg=NONE ctermbg=NONE")
  end,
}
