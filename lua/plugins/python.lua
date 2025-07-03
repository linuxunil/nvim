return {
	-- Python environment management
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		ft = "python",
		keys = {
			{ "<leader>pev", "<cmd>VenvSelect<cr>", desc = "Select Python environment" },
		},
		opts = {
			name = { "venv", ".venv", "env", ".env" },
			auto_refresh = true,
		},
		config = function(_, opts)
			require("venv-selector").setup(opts)
		end,
	},

	-- Python REPL
	{
		"Vigemus/iron.nvim",
		ft = "python",
		keys = {
			{ "<leader>pr", function() require("iron.core").repl_for(vim.bo.filetype) end, desc = "Start Python REPL" },
			{ "<leader>ps", function() require("iron.core").send_line() end,               desc = "Send line to REPL" },
			{ "<leader>pf", function() require("iron.core").send_file() end,               desc = "Send file to REPL" },
			{ "<leader>pm", function() require("iron.core").send_mark() end,               desc = "Send marked text to REPL" },
		},
		config = function()
			local iron = require("iron.core")
			iron.setup({
				config = {
					scratch_repl = true,
					repl_definition = {
						python = {
							command = { "uv", "run", "python" }, -- Use UV to run Python
							format = require("iron.fts.common").bracketed_paste,
						},
					},
					repl_open_cmd = require("iron.view").right(50),
				},
				keymaps = {
					send_motion = "<leader>sc",
					visual_send = "<leader>sc",
					send_file = "<leader>sf",
					send_line = "<leader>sl",
					send_mark = "<leader>sm",
					mark_motion = "<leader>mc",
					mark_visual = "<leader>mc",
					remove_mark = "<leader>md",
					cr = "<leader>s<cr>",
					interrupt = "<leader>s<space>",
					exit = "<leader>sq",
					clear = "<leader>cl",
				},
			})
		end,
	},

	-- Python docstring generation
	{
		"danymat/neogen",
		keys = {
			{ "<leader>cg", function() require("neogen").generate() end, desc = "Generate docstring" },
		},
		opts = {
			snippet_engine = "luasnip",
			languages = {
				python = {
					template = {
						annotation_convention = "google_docstrings",
					},
				},
			},
		},
	},

	-- Python indentation
	{
		"Vimjas/vim-python-pep8-indent",
		ft = "python",
	},

	-- Python text objects
	{
		"jeetsukumaran/vim-pythonsense",
		ft = "python",
	},
}
