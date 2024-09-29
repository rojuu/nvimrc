function ClearBg()
  vim.cmd.hi("Normal guibg=NONE ctermbg=NONE")
end

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function file_exists(filename)
  return vim.fn.filereadable(filename) == 1
end

vim.opt.errorformat:append("%f(%l:%c) %m") -- odin error format

local function set_makeprg()
  if vim.fn.has("win32") then
    if file_exists("build.bat") then
      vim.opt.makeprg = ".\\build.bat"
    else
      vim.opt.makeprg = 'echo "No build system found"'
    end
  else
    if file_exists("build.sh") then
      vim.opt.makeprg = "./build.sh"
    elseif file_exists("Makefile") then
      vim.opt.makeprg = "make"
    else
      vim.opt.makeprg = 'echo "No build system found"'
    end
  end
end

vim.api.nvim_create_autocmd("DirChanged", {
  desc = "Set makeprg based on current dir contents",
  pattern = { "global" },
  group = vim.api.nvim_create_augroup("makeprg-dir-based-setter", { clear = true }),
  callback = function()
    set_makeprg()
  end,
})

set_makeprg()
