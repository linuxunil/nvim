-- lua/keymaps.lua (Clean - Core Editor Only)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ===== CORE EDITOR MAPPINGS =====
-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Better paste
map("v", "p", '"_dP', opts)

-- ===== WINDOW MANAGEMENT =====
-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- ===== FIND/FILES (Telescope) =====
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", { desc = "Colorscheme" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })

-- ===== BUFFER MANAGEMENT =====
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- ===== LSP =====
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- ===== FORMATTING =====
map("n", "<leader>cf", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format buffer" })

-- ===== GIT NAVIGATION =====
map("n", "]g", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next git hunk" })
map("n", "[g", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous git hunk" })

-- ===== TESTING (Capital T to avoid terminal conflicts) =====
map("n", "<leader>Tn", function()
	require("neotest").run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>Tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run file tests" })
map("n", "<leader>Td", function()
	require("neotest").run.run({ strategy = "dap" })
end, { desc = "Debug nearest test" })
map("n", "<leader>Ts", function()
	require("neotest").summary.toggle()
end, { desc = "Test summary" })
map("n", "<leader>To", function()
	require("neotest").output.open({ enter = true })
end, { desc = "Test output" })

-- ===== NOTE =====
-- Language-specific keymaps are now in their respective plugin files:
-- Go: lua/plugins/go.lua       -> <leader>go*
-- Python: lua/plugins/python.lua -> <leader>py*
-- Zig: lua/plugins/zig.lua     -> <leader>zg*
-- Markdown: lua/plugins/markdown.lua -> <leader>m*
-- Neorg: lua/plugins/neorg.lua -> <leader>n*

-- Tool-specific keymaps are in their plugin files:
-- Terminal: lua/plugins/snacks.lua -> <leader>t*
-- Git: lua/plugins/snacks.lua -> <leader>g*
-- Debug: lua/plugins/debugging.lua -> <leader>d*
