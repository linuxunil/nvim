local M = {}

function M.setup()
  local opt = vim.opt

  opt.number = true
  opt.relativenumber = true
  opt.termguicolors = true
  opt.signcolumn = "yes"
  opt.updatetime = 200
  opt.timeoutlen = 300
  opt.completeopt = { "menu", "menuone", "noselect" }
  opt.mouse = "a"
  opt.clipboard = "unnamedplus"
  opt.tabstop = 2
  opt.shiftwidth = 2
  opt.expandtab = true
end

return M
