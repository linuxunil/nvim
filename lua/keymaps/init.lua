local M = {}

function M.setup()
  local km = vim.keymap

  km.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
  km.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
  km.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Buffers" })
  km.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })
  km.set("n", "<leader>db", ":DBUI<CR>", { desc = "Open DB UI" })

  km.set("n", "<leader>e", function()
    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
  end, { desc = "Mini Files" })

  km.set("n", "<leader>bd", function()
    require("mini.bufremove").delete(0, false)
  end, { desc = "Close Buffer" })

  km.set("v", "<leader>rr", function()
    require("refactoring").select_refactor()
  end, { desc = "Refactor", noremap = true, silent = true })
end

return M
