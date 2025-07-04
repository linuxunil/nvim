-- lua/plugins/editing/treesitter.lua
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"regex",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"jsonc",
				"python",
				"go",
				"zig",
				"rust",
				"java",
				"cpp",
				"yaml",
				"toml",
				"xml",
				"ini",
				"dockerfile",
				"gitignore",
				"gitcommit",
				"markdown",
				"markdown_inline",
				"sql",
			},
			highlight = { enable = true },
			indent = { enable = true, disable = { "python" } },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
					goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
					goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
					goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
