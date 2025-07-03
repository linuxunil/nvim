-- Statusline (simplified)
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
	lazy = false,
	opts = {
		options = {
			theme = "catppuccin",
			globalstatus = true,
			disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {
				"diagnostics",
				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
			},
			lualine_x = {
				-- DAP status (simplified)
				{
					function()
						return package.loaded["dap"]
								and require("dap").status() ~= ""
								and "  " .. require("dap").status()
							or ""
					end,
					cond = function()
						return package.loaded["dap"] and require("dap").status() ~= ""
					end,
					color = { fg = "#94e2d5" },
				},
				"diff",
			},
			lualine_y = { "progress", "location" },
			lualine_z = {
				function()
					return " " .. os.date("%R")
				end,
			},
		},
		extensions = { "lazy" },
	},
}
