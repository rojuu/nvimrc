if vim.g.load_treesitter == 1 then
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "cpp", "lua" },

    sync_install = false,

    ignore_install = { },

    highlight = {
      enable = true,
      disable = { },
      additional_vim_regex_highlighting = false,
    },
  }

  require'treesitter-context'.setup {
    enable = true,
    max_lines = 0,
  }
end
