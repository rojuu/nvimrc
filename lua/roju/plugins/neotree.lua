return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = true,
  keys = "<leader>b",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neotree = require("neo-tree")
    neotree.setup({
      filesystem = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        hijack_netrw_behavior = "disabled",
      },
    })

    vim.keymap.set("n", "<leader>b", ":Neotree toggle<CR>")
  end,
}
