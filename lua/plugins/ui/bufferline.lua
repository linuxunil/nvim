-- lua/plugins/ui/bufferline.lua
return {
	{
		"akinsho/bufferline.nvim",
		dependencies = { "echasnovski/mini.icons" },
		lazy = false,
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
			{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		},
		opts = {
			options = {
				close_command = function(n)
					require("snacks").bufdelete(n)
				end,
				right_mouse_command = function(n)
					require("snacks").bufdelete(n)
				end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "snacks_explorer",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
}
