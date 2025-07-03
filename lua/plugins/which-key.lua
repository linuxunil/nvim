-- lua/plugins/which-key.lua (Updated with new keymap scheme)
return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.setup({
				plugins = { spelling = true },
				win = { border = "rounded" },
			})

			-- Register key mappings with new scheme
			wk.add({
				-- Single character prefixes
				{ "g", group = "goto" },
				{ "gs", group = "surround" },
				{ "]", group = "next" },
				{ "[", group = "prev" },

				-- Leader key groups
				{ "<leader>b", group = "buffer" },
				{ "<leader>c", group = "code" },
				{ "<leader>d", group = "debug" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>g", group = "git" },
				{ "<leader>m", group = "markdown" },
				{ "<leader>n", group = "notes/neorg" },
				{ "<leader>q", group = "quit/session" },
				{ "<leader>s", group = "search" },
				{ "<leader>t", group = "terminal" },
				{ "<leader>T", group = "testing" },
				{ "<leader>u", group = "ui/toggle" },
				{ "<leader>w", group = "windows" },
				{ "<leader>x", group = "diagnostics/quickfix" },

				-- Language-specific groups (NEW SCHEME)
				{ "<leader>go", group = "go" },
				{ "<leader>py", group = "python" },
				{ "<leader>zg", group = "zig" },

				-- Sub-groups
				{ "<leader>dg", group = "debug go" },
				{ "<leader>py", group = "python" },
				{ "<leader>pye", desc = "Select Python environment" },

				-- File/Find
				{ "<leader>ff", desc = "Find files" },
				{ "<leader>fg", desc = "Live grep" },
				{ "<leader>fb", desc = "Buffers" },
				{ "<leader>fh", desc = "Help tags" },
				{ "<leader>fr", desc = "Recent files" },
				{ "<leader>fc", desc = "Colorscheme" },
				{ "<leader>fk", desc = "Keymaps" },

				-- File explorer
				{ "<leader>e", desc = "File explorer (current dir)" },
				{ "<leader>E", desc = "File explorer (cwd)" },

				-- Buffer management (using snacks.nvim)
				{ "<leader>bd", desc = "Delete buffer" },
				{ "<leader>bD", desc = "Delete buffer (force)" },
				{ "<leader>bp", desc = "Toggle pin" },
				{ "<leader>bP", desc = "Delete non-pinned buffers" },
				{ "<leader>bo", desc = "Delete other buffers" },
				{ "<leader>br", desc = "Delete buffers to the right" },
				{ "<leader>bl", desc = "Delete buffers to the left" },

				-- Code
				{ "<leader>ca", desc = "Code actions" },
				{ "<leader>cf", desc = "Format buffer" },
				{ "<leader>cg", desc = "Generate docstring" },
				{ "<leader>cR", desc = "Rename file" },

				-- Debug
				{ "<leader>db", desc = "Toggle breakpoint" },
				{ "<leader>dc", desc = "Continue" },
				{ "<leader>dC", desc = "Run to cursor" },
				{ "<leader>dg", desc = "Go to line (no execute)" },
				{ "<leader>di", desc = "Step into" },
				{ "<leader>dj", desc = "Down" },
				{ "<leader>dk", desc = "Up" },
				{ "<leader>dl", desc = "Show log" },
				{ "<leader>do", desc = "Step out" },
				{ "<leader>dO", desc = "Step over" },
				{ "<leader>dp", desc = "Pause" },
				{ "<leader>dr", desc = "REPL" },
				{ "<leader>ds", desc = "Session" },
				{ "<leader>dt", desc = "Terminate" },
				{ "<leader>dw", desc = "Widgets" },

				-- Git (unchanged)
				{ "<leader>gg", desc = "LazyGit" },
				{ "<leader>gb", desc = "Git blame line" },
				{ "<leader>gB", desc = "Git browse" },
				{ "<leader>gp", desc = "Preview hunk" },
				{ "<leader>gR", desc = "Reset hunk" },
				{ "<leader>gf", desc = "File history" },
				{ "<leader>gl", desc = "Git log" },

				-- Go specific (NEW SCHEME - <leader>go*)
				{ "<leader>gor", desc = "Run Go file" },
				{ "<leader>goR", desc = "Run current Go file" },
				{ "<leader>gob", desc = "Build Go project" },
				{ "<leader>goB", desc = "Build current Go file" },
				{ "<leader>got", desc = "Run Go tests" },
				{ "<leader>goT", desc = "Test Go function" },
				{ "<leader>goa", desc = "Test current file" },
				{ "<leader>goA", desc = "Test package" },
				{ "<leader>goc", desc = "Go coverage" },
				{ "<leader>goC", desc = "Clear coverage" },
				{ "<leader>gof", desc = "Format Go file" },
				{ "<leader>goi", desc = "Go imports" },
				{ "<leader>goI", desc = "Add import" },
				{ "<leader>gom", desc = "Go mod tidy" },
				{ "<leader>goM", desc = "Go mod init" },
				{ "<leader>gov", desc = "Go vet" },
				{ "<leader>gol", desc = "Go lint" },
				{ "<leader>god", desc = "Go documentation" },
				{ "<leader>gos", desc = "Fill struct" },
				{ "<leader>goS", desc = "Fill switch" },
				{ "<leader>goe", desc = "Add if err" },
				{ "<leader>goE", desc = "Add test for function" },
				{ "<leader>goj", desc = "Add struct tags" },
				{ "<leader>goJ", desc = "Remove struct tags" },
				{ "<leader>goo", desc = "Implement interface" },
				{ "<leader>gon", desc = "Switch to test file" },
				{ "<leader>goN", desc = "Switch to test (vertical)" },

				-- Python specific (NEW SCHEME - <leader>py*)
				{ "<leader>pyr", desc = "Run Python file with UV" },
				{ "<leader>pyt", desc = "Run tests with UV" },
				{ "<leader>pyi", desc = "Install package with UV" },
				{ "<leader>pyn", desc = "Sync dependencies with UV" },
				{ "<leader>pyv", desc = "Create virtual environment" },
				{ "<leader>pyc", desc = "Check code with Ruff" },
				{ "<leader>pyf", desc = "Format code with Ruff" },
				{ "<leader>pye", desc = "Select Python environment" },
				{ "<leader>pyR", desc = "Start Python REPL" },
				{ "<leader>pys", desc = "Send line to REPL" },
				{ "<leader>pyS", desc = "Send file to REPL" },
				{ "<leader>pym", desc = "Send marked text to REPL" },

				-- Zig specific (NEW SCHEME - <leader>zg*)
				{ "<leader>zgr", desc = "Run Zig file" },
				{ "<leader>zgt", desc = "Test Zig file" },
				{ "<leader>zgb", desc = "Build Zig project" },
				{ "<leader>zgf", desc = "Format Zig file" },
				{ "<leader>zgc", desc = "Check Zig file" },
				{ "<leader>zgi", desc = "Initialize Zig project" },

				-- Terminal (using snacks.nvim)
				{ "<leader>th", desc = "Terminal horizontal" },
				{ "<leader>tv", desc = "Terminal vertical" },
				{ "<leader>tt", desc = "Terminal toggle" },

				-- Testing (Capital T to avoid terminal conflicts)
				{ "<leader>Tn", desc = "Run nearest test" },
				{ "<leader>Tf", desc = "Run file tests" },
				{ "<leader>Td", desc = "Debug nearest test" },
				{ "<leader>Ts", desc = "Test summary" },
				{ "<leader>To", desc = "Test output" },

				-- Markdown specific
				{ "<leader>mp", desc = "Markdown preview" },
				{ "<leader>mt", desc = "Toggle table mode" },
				{ "<leader>mT", desc = "Generate TOC" },
				{ "<leader>mv", desc = "Toggle markview" },
				{ "<leader>mi", desc = "Paste image" },

				-- Neorg specific
				{ "<leader>nw", desc = "Neorg workspaces" },
				{ "<leader>nr", desc = "Return to index" },
				{ "<leader>ni", desc = "Open workspace index" },
				{ "<leader>nj", desc = "Open journal" },
				{ "<leader>nt", desc = "Today's journal" },
				{ "<leader>ny", desc = "Yesterday's journal" },
				{ "<leader>nm", desc = "Tomorrow's journal" },
				{ "<leader>nn", desc = "New note" },
				{ "<leader>ntc", desc = "Table of contents" },
				{ "<leader>nts", desc = "Tangle current file" },

				-- UI/Toggle
				{ "<leader>un", desc = "Dismiss notifications" },
				{ "<leader>us", desc = "Toggle spelling" },
				{ "<leader>uw", desc = "Toggle wrap" },
				{ "<leader>uL", desc = "Toggle relative numbers" },
				{ "<leader>ud", desc = "Toggle diagnostics" },
				{ "<leader>ul", desc = "Toggle line numbers" },
				{ "<leader>uc", desc = "Toggle conceal" },
				{ "<leader>uT", desc = "Toggle treesitter" },
				{ "<leader>ub", desc = "Toggle background" },
				{ "<leader>uh", desc = "Toggle inlay hints" },

				-- Diagnostics/Quickfix
				{ "<leader>xx", desc = "Diagnostics (Trouble)" },
				{ "<leader>xX", desc = "Buffer Diagnostics (Trouble)" },
				{ "<leader>cs", desc = "Symbols (Trouble)" },
				{ "<leader>cl", desc = "LSP Definitions/references (Trouble)" },
				{ "<leader>xL", desc = "Location List (Trouble)" },
				{ "<leader>xQ", desc = "Quickfix List (Trouble)" },
				{ "<leader>xt", desc = "Todo (Trouble)" },
				{ "<leader>xT", desc = "Todo/Fix/Fixme (Trouble)" },
				{ "<leader>st", desc = "Todo search" },
				{ "<leader>sT", desc = "Urgent todo search" },

				-- Todo navigation
				{ "]t", desc = "Next todo comment" },
				{ "[t", desc = "Previous todo comment" },

				-- Utilities
				{ "<leader>N", desc = "Neovim News" },
				{ "<leader>zm", desc = "Zen mode" },
				{ "<c-/>", desc = "Toggle terminal" },
				{ "<c-_>", desc = "Toggle terminal" },

				-- LSP mappings
				{ "gd", desc = "Go to definition" },
				{ "gD", desc = "Go to declaration" },
				{ "gr", desc = "References" },
				{ "gi", desc = "Go to implementation" },
				{ "K", desc = "Hover documentation" },
				{ "<leader>rn", desc = "Rename" },
				{ "<leader>d", desc = "Show diagnostics" },
				{ "[d", desc = "Previous diagnostic" },
				{ "]d", desc = "Next diagnostic" },
				{ "]g", desc = "Next git hunk" },
				{ "[g", desc = "Previous git hunk" },

				-- Buffer navigation
				{ "<S-h>", desc = "Previous buffer" },
				{ "<S-l>", desc = "Next buffer" },
				{ "[b", desc = "Previous buffer" },
				{ "]b", desc = "Next buffer" },

				-- Treesitter text objects navigation
				{ "]f", desc = "Next function" },
				{ "[f", desc = "Previous function" },
				{ "]c", desc = "Next class" },
				{ "[c", desc = "Previous class" },
				{ "]F", desc = "Next function end" },
				{ "[F", desc = "Previous function end" },
				{ "]C", desc = "Next class end" },
				{ "[C", desc = "Previous class end" },

				-- Mini.surround
				{ "gsa", desc = "Add surrounding", mode = { "n", "v" } },
				{ "gsd", desc = "Delete surrounding" },
				{ "gsf", desc = "Find surrounding (right)" },
				{ "gsF", desc = "Find surrounding (left)" },
				{ "gsh", desc = "Highlight surrounding" },
				{ "gsr", desc = "Replace surrounding" },
				{ "gsn", desc = "Update n_lines" },

				-- Mini.move
				{ "<M-h>", desc = "Move left", mode = { "n", "v" } },
				{ "<M-j>", desc = "Move down", mode = { "n", "v" } },
				{ "<M-k>", desc = "Move up", mode = { "n", "v" } },
				{ "<M-l>", desc = "Move right", mode = { "n", "v" } },

				-- Mini.jump
				{ "f", desc = "Jump forward" },
				{ "F", desc = "Jump backward" },
				{ "t", desc = "Jump till forward" },
				{ "T", desc = "Jump till backward" },
				{ ";", desc = "Repeat jump" },

				-- Word navigation
				{ "]]", desc = "Next Reference" },
				{ "[[", desc = "Prev Reference" },
			})
		end,
	},
}
