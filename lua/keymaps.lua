-- lua/keymaps.lua (Enhanced with Zig and Go support)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", { desc = "Colorscheme" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })

-- File explorer (now handled by mini.files plugin)
-- No keymap here - handled in mini.lua

-- Buffer management (now handled by mini.bufremove plugin)
-- No keymaps here - handled in mini.lua
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- LSP
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

-- Formatting
map("n", "<leader>cf", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format buffer" })

-- Refactoring
map({ "n", "v" }, "<leader>rr", function()
  require("refactoring").select_refactor()
end, { desc = "Refactor" })

-- Terminal
map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", { desc = "Terminal horizontal" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", { desc = "Terminal vertical" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminal float" })

-- Python development keymaps
map("n", "<leader>pr", "<cmd>!uv run %<CR>", { desc = "Run Python file with UV" })
map("n", "<leader>pt", "<cmd>!uv run pytest<CR>", { desc = "Run tests with UV" })
map("n", "<leader>pi", "<cmd>!uv add ", { desc = "Install package with UV" })
map("n", "<leader>ps", "<cmd>!uv sync<CR>", { desc = "Sync dependencies with UV" })
map("n", "<leader>pv", "<cmd>!uv venv<CR>", { desc = "Create virtual environment" })
map("n", "<leader>pc", "<cmd>!uv run ruff check .<CR>", { desc = "Check code with Ruff" })
map("n", "<leader>pf", "<cmd>!uv run ruff format .<CR>", { desc = "Format code with Ruff" })

-- Go development keymaps (Note: These are handled in go.lua plugin)
-- But adding direct keymaps for convenience
map("n", "<leader>gr", "<cmd>GoRun<CR>", { desc = "Run Go file" })
map("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Test Go package" })
map("n", "<leader>gb", "<cmd>GoBuild<CR>", { desc = "Build Go project" })
map("n", "<leader>gf", "<cmd>GoFmt<CR>", { desc = "Format Go file" })
map("n", "<leader>gi", "<cmd>GoImports<CR>", { desc = "Go imports" })

-- Zig development keymaps
map("n", "<leader>zr", "<cmd>ZigRun<CR>", { desc = "Run Zig file" })
map("n", "<leader>zt", "<cmd>ZigTest<CR>", { desc = "Test Zig file" })
map("n", "<leader>zb", "<cmd>ZigBuild<CR>", { desc = "Build Zig project" })
map("n", "<leader>zf", "<cmd>ZigFmt<CR>", { desc = "Format Zig file" })
map("n", "<leader>zc", "<cmd>ZigCheck<CR>", { desc = "Check Zig file" })

-- Git
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Git blame line" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "]g", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next git hunk" })
map("n", "[g", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous git hunk" })
