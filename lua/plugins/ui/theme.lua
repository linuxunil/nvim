-- lua/plugins/ui/theme.lua - Catppuccin Theme Configuration
-- Focused configuration for the colorscheme only

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- Load before other UI plugins
		lazy = false, -- Load immediately for consistent theming
		opts = {
			flavour = "frappe", -- mocha, macchiato, frappe, latte
			background = {
				light = "latte",
				dark = "frappe",
			},
			transparent_background = false,
			show_end_of_buffer = false,
			term_colors = true,

			-- Subtle dimming for inactive windows
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.15,
			},

			-- Typography styles
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},

			-- Plugin integrations (essential UI only)
			integrations = {
				-- Core completion and LSP
				cmp = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},

				-- Essential UI components
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				which_key = true,

				-- Git integration
				gitsigns = true,

				-- Syntax and structure
				treesitter = true,
				treesitter_context = true,

				-- Enhanced UI
				mini = {
					enabled = true,
					indentscope_color = "lavender",
				},

				-- Development tools
				mason = true,
				trouble = true,
				lsp_trouble = true,

				-- Debug integration
				dap = {
					enabled = true,
					enable_ui = true,
				},

				-- Terminal and notifications
				snacks = true,

				-- Markdown support
				markdown = true,

				-- Additional integrations
				illuminate = {
					enabled = true,
					lsp = false,
				},
				indent_blankline = {
					enabled = true,
					scope_color = "",
					colored_indent_levels = false,
				},

				-- Disable unused integrations for performance
				barbecue = false,
				beacon = false,
				bufferline = true,
				dashboard = false, -- Using alpha instead
				feline = false,
				gitgutter = false,
				hop = false,
				leap = false,
				lightline = false,
				lualine = true,
				navic = false,
				neogit = false,
				neotest = true,
				notify = false, -- Using snacks
				nvimtree = false,
				octo = false,
				overseer = false,
				rainbow_delimiters = false,
				sandwich = false,
				semantic_tokens = true,
				symbols_outline = false,
				telekasten = false,
				ts_rainbow = false,
				vim_sneak = false,
				vimwiki = false,
			},

			-- Custom highlight overrides (minimal)
			custom_highlights = {},

			-- Color overrides (use sparingly)
			color_overrides = {},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)

			-- Apply the colorscheme
			vim.cmd.colorscheme("catppuccin-frappe")

			-- Optional: Set terminal colors for integrated terminal
			if vim.g.terminal_colors then
				vim.g.terminal_color_0 = "#51576d"
				vim.g.terminal_color_1 = "#e78284"
				vim.g.terminal_color_2 = "#a6d189"
				vim.g.terminal_color_3 = "#e5c890"
				vim.g.terminal_color_4 = "#8caaee"
				vim.g.terminal_color_5 = "#f4b8e4"
				vim.g.terminal_color_6 = "#81c8be"
				vim.g.terminal_color_7 = "#b5bfe2"
				vim.g.terminal_color_8 = "#626880"
				vim.g.terminal_color_9 = "#e78284"
				vim.g.terminal_color_10 = "#a6d189"
				vim.g.terminal_color_11 = "#e5c890"
				vim.g.terminal_color_12 = "#8caaee"
				vim.g.terminal_color_13 = "#f4b8e4"
				vim.g.terminal_color_14 = "#81c8be"
				vim.g.terminal_color_15 = "#a5adce"
			end
		end,
	},
}

--[[
Theme Configuration Philosophy:

1. CONSISTENCY: One theme for everything, consistent experience
2. PERFORMANCE: Only enable integrations for plugins we actually use
3. READABILITY: Subtle styling that doesn't distract from code
4. ACCESSIBILITY: Good contrast and clear visual hierarchy

Theme Loading Strategy:
- priority = 1000: Loads before other UI plugins
- lazy = false: Loads immediately for consistent theming
- All UI plugins can then use the theme colors consistently

Integration Strategy:
- Enable only plugins we actually use
- Disable unused integrations for better performance
- Use consistent styling across all integrated plugins
]]
