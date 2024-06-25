return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true, -- disables setting the background color.
      no_italic = true, -- Force no italic
      no_bold = true, -- Force no bold
      no_underline = true, -- Force no underline
      color_overrides = {
        mocha = {
          base = "#1c1917", -- default: #1E1E2E
          mantle = "#171717", -- default #181825
          crust = "#0c0a09", -- default: #11111B
        },
      },
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })
  end,
}
