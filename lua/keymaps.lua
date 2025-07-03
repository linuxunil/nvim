local map = vim.keymap.set

map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })

map("n", "<leader>db", ":DBUI<CR>", { desc = "Open DB UI" })

map("n", "<leader>e", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "Open Mini Files" })

map("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })

map("n", "<leader>rr", function()
  require("refactoring").select_refactor()
end, { desc = "Refactor" })

map("n", "<leader>bd", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Close Buffer" })

