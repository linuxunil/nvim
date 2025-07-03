-- lua/plugins/terminal.lua
return {
	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "Terminal horizontal" },
			{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>",   desc = "Terminal vertical" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>",              desc = "Terminal float" },
		},
		opts = {
			size = 20,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			direction = "float",
			close_on_exit = true,
		},
	},
}
