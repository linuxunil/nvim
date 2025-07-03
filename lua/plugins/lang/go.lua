-- lua/plugins/go.lua (Drastically Simplified)
return {
	-- Primary Go language support
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		ft = { "go", "gomod", "gowork", "gotmpl" },
		build = ':lua require("go.install").update_all_sync()',
		event = { "CmdlineEnter" },
		keys = {
			-- Go execution and building
			{ "<leader>gor", "<cmd>GoRun<cr>", desc = "Run Go file", ft = "go" },
			{ "<leader>goR", "<cmd>GoRun %<cr>", desc = "Run current Go file", ft = "go" },
			{ "<leader>gob", "<cmd>GoBuild<cr>", desc = "Build Go project", ft = "go" },
			{ "<leader>goB", "<cmd>GoBuild %<cr>", desc = "Build current Go file", ft = "go" },

			-- Go testing
			{ "<leader>got", "<cmd>GoTest<cr>", desc = "Run Go tests", ft = "go" },
			{ "<leader>goT", "<cmd>GoTestFunc<cr>", desc = "Test function under cursor", ft = "go" },
			{ "<leader>goa", "<cmd>GoTestFile<cr>", desc = "Test current file", ft = "go" },
			{ "<leader>goA", "<cmd>GoTestPkg<cr>", desc = "Test package", ft = "go" },
			{ "<leader>goc", "<cmd>GoCoverage<cr>", desc = "Show test coverage", ft = "go" },
			{ "<leader>goC", "<cmd>GoCoverageClear<cr>", desc = "Clear coverage", ft = "go" },

			-- Go formatting and imports
			{ "<leader>gof", "<cmd>GoFmt<cr>", desc = "Format Go code", ft = "go" },
			{ "<leader>goi", "<cmd>GoImports<cr>", desc = "Organize imports", ft = "go" },
			{ "<leader>goI", "<cmd>GoImport<cr>", desc = "Add import", ft = "go" },

			-- Go tools and utilities
			{ "<leader>gom", "<cmd>GoMod<cr>", desc = "Go mod tidy", ft = "go" },
			{ "<leader>goM", "<cmd>GoModInit<cr>", desc = "Go mod init", ft = "go" },
			{ "<leader>gov", "<cmd>GoVet<cr>", desc = "Go vet", ft = "go" },
			{ "<leader>gol", "<cmd>GoLint<cr>", desc = "Go lint", ft = "go" },
			{ "<leader>god", "<cmd>GoDoc<cr>", desc = "Go documentation", ft = "go" },

			-- Go code generation
			{ "<leader>gos", "<cmd>GoFillStruct<cr>", desc = "Fill struct", ft = "go" },
			{ "<leader>goS", "<cmd>GoFillSwitch<cr>", desc = "Fill switch", ft = "go" },
			{ "<leader>goe", "<cmd>GoIfErr<cr>", desc = "Add if err", ft = "go" },
			{ "<leader>goE", "<cmd>GoAddTest<cr>", desc = "Add test for function", ft = "go" },

			-- Go tags and interface
			{ "<leader>goj", "<cmd>GoAddTag<cr>", desc = "Add struct tags", ft = "go" },
			{ "<leader>goJ", "<cmd>GoRmTag<cr>", desc = "Remove struct tags", ft = "go" },
			{ "<leader>goo", "<cmd>GoImpl<cr>", desc = "Implement interface", ft = "go" },

			-- Go navigation
			{ "<leader>gon", "<cmd>GoAlt<cr>", desc = "Switch to test file", ft = "go" },
			{ "<leader>goN", "<cmd>GoAltV<cr>", desc = "Switch to test (vertical)", ft = "go" },
		},
		config = function()
			require("go").setup({
				-- ===== ESSENTIAL CONFIGURATION ONLY =====
				-- Use gofumpt for formatting (better than gofmt)
				gofmt = "gofumpt",

				-- Enable LSP integration
				lsp_cfg = true,
				lsp_inlay_hints = { enable = true },

				-- Enable DAP debugging
				dap_debug = true,

				-- Auto-format on save
				auto_format = true,

				-- ===== LET GO.NVIM USE ITS TESTED DEFAULTS =====
				-- Removed 180+ lines of configuration that just duplicated defaults
				-- This makes the config much more maintainable and reliable
			})

			-- ===== SIMPLIFIED AUTO-FORMAT =====
			-- Only keep essential auto-format (goimports on save)
			local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					require("go.format").goimports()
				end,
				group = format_sync_grp,
			})
		end,
	},

	-- Go debugging support (simplified)
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = { "mfussenegger/nvim-dap" },
		keys = {
			{
				"<leader>dgt",
				function()
					require("dap-go").debug_test()
				end,
				desc = "Debug Go test",
				ft = "go",
			},
			{
				"<leader>dgl",
				function()
					require("dap-go").debug_last()
				end,
				desc = "Debug last Go test",
				ft = "go",
			},
			{
				"<leader>dgr",
				function()
					require("dap-go").debug_restart()
				end,
				desc = "Debug restart",
				ft = "go",
			},
		},
		opts = {
			-- Use defaults - they work great!
			-- Removed 50+ lines of manual configuration
		},
	},
}
