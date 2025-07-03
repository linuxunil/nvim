-- lua/keymaps.lua (Optimized with conflict resolution)
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

-- Buffer management (using snacks.nvim)
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

-- Git (resolved conflicts - moved Go to <leader>G*)
map("n", "<leader>gb", function() require("snacks").git.blame_line() end, { desc = "Git blame line" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "]g", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next git hunk" })
map("n", "[g", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous git hunk" })

-- Go development (moved to <leader>G* to resolve conflicts)
map("n", "<leader>Gr", "<cmd>GoRun<CR>", { desc = "Run Go file" })
map("n", "<leader>Gt", "<cmd>GoTest<CR>", { desc = "Test Go package" })
map("n", "<leader>GT", "<cmd>GoTestFunc<CR>", { desc = "Test Go function" })
map("n", "<leader>Gb", "<cmd>GoBuild<CR>", { desc = "Build Go project" })
map("n", "<leader>Gf", "<cmd>GoFmt<CR>", { desc = "Format Go file" })
map("n", "<leader>Gi", "<cmd>GoImports<CR>", { desc = "Go imports" })
map("n", "<leader>Gc", "<cmd>GoCoverage<CR>", { desc = "Go coverage" })

-- Python development
map("n", "<leader>pr", "<cmd>!uv run %<CR>", { desc = "Run Python file with UV" })
map("n", "<leader>pt", "<cmd>!uv run pytest<CR>", { desc = "Run tests with UV" })
map("n", "<leader>pi", "<cmd>!uv add ", { desc = "Install package with UV" })
map("n", "<leader>ps", "<cmd>!uv sync<CR>", { desc = "Sync dependencies with UV" })
map("n", "<leader>pv", "<cmd>!uv venv<CR>", { desc = "Create virtual environment" })
map("n", "<leader>pc", "<cmd>!uv run ruff check .<CR>", { desc = "Check code with Ruff" })
map("n", "<leader>pf", "<cmd>!uv run ruff format .<CR>", { desc = "Format code with Ruff" })

-- Zig development
map("n", "<leader>zr", "<cmd>ZigRun<CR>", { desc = "Run Zig file" })
map("n", "<leader>zt", "<cmd>ZigTest<CR>", { desc = "Test Zig file" })
map("n", "<leader>zb", "<cmd>ZigBuild<CR>", { desc = "Build Zig project" })
map("n", "<leader>zf", "<cmd>ZigFmt<CR>", { desc = "Format Zig file" })
map("n", "<leader>zc", "<cmd>ZigCheck<CR>", { desc = "Check Zig file" })

-- Terminal (using snacks.nvim exclusively, resolved conflicts)
map("n", "<leader>th", function() require("snacks").terminal() end, { desc = "Terminal horizontal" })
map("n", "<leader>tv", function() require("snacks").terminal() end, { desc = "Terminal vertical" })
map("n", "<leader>tt", function() require("snacks").terminal() end, { desc = "Terminal toggle" })

-- Test (resolved <leader>tf conflict - moved to <leader>tT)
map("n", "<leader>tT", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run file tests" })
