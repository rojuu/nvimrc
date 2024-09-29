vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>x", ":%s/\\(\\s\\)\\+$//g<CR> ``", { silent = true })

vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>dt", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "[T]oggle Diagnostics" })
vim.keymap.set("n", "<leader>de", function()
  vim.diagnostic.enable(true)
end, { desc = "[E]nable diagnostics" })
vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.enable(false)
end, { desc = "[D]isable diagnostics" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("v", "j", "gj", { silent = true })
vim.keymap.set("v", "k", "gk", { silent = true })

vim.keymap.set("n", "<leader>v", "<C-W><C-V><C-W><C-L>")
vim.keymap.set("n", "<leader>s", "<C-W><C-S>")
vim.keymap.set("n", "<leader>q", "<C-W><C-Q>")

vim.keymap.set("n", "<leader>cn", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>cp", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>cw", ":cwindow<CR>", { silent = true })
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })

vim.keymap.set("n", "<leader>m", ":make<CR><ESC>:copen<CR><C-W><C-P>", { silent = true })

vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

vim.keymap.set("v", "<TAB>", ">gv", { silent = true })
vim.keymap.set("v", "<S-TAB>", "<gv", { silent = true })

vim.keymap.set("n", "<leader>tt", "<C-]>")

-- yank current file full path to system clipboard
vim.keymap.set("n", "<leader>yf", ':let @+ = expand("%:p")<CR>', { silent = true })
-- yank current file relative path to system clipboard
vim.keymap.set("n", "<leader>yr", ':let @+ = expand("%")<CR>', { silent = true })

vim.keymap.set("n", "å", "{")
vim.keymap.set("n", "ö", "}")
vim.keymap.set("x", "å", "{")
vim.keymap.set("x", "ö", "}")

-- C-S to save
vim.keymap.set("n", "<C-S>", ":w<CR>")
