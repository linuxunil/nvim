-- init.lua
require("settings")
require("keymaps")
require("autocmds")
require("mise-integragion")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup("plugins", {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin"
      },
    },
  },
})


-- Setup mise integration
local mise_ok, mise = pcall(require, 'mise-integration')
if mise_ok then
  mise.setup_lsp_paths()
  mise.setup_auto_activation()

  -- Add keybindings for mise
  vim.keymap.set('n', '<leader>mi', function() mise.show_info() end, { desc = 'Mise info' })
  vim.keymap.set('n', '<leader>mr', function()
    vim.ui.input({ prompt = 'Mise task: ' }, function(task)
      if task then mise.run_task(task) end
    end)
  end, { desc = 'Run mise task' })
end
