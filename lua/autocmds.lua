-- lua/autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Auto-resize splits when window is resized
augroup("ResizeSplits", { clear = true })
autocmd("VimResized", {
	group = "ResizeSplits",
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Python-specific settings
augroup("PythonSettings", { clear = true })
autocmd("FileType", {
	group = "PythonSettings",
	pattern = "python",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
		vim.opt_local.colorcolumn = "88" -- Black's line length
	end,
})

-- Auto-detect Python virtual environments
augroup("PythonVenv", { clear = true })
autocmd("BufEnter", {
	group = "PythonVenv",
	pattern = "*.py",
	callback = function()
		-- Try to find and activate UV environment
		local uv_venv = vim.fn.finddir(".venv", ".;")
		if uv_venv ~= "" then
			vim.env.VIRTUAL_ENV = vim.fn.fnamemodify(uv_venv, ":p")
			vim.env.PATH = vim.env.VIRTUAL_ENV .. "/bin:" .. vim.env.PATH
		end
	end,
})

-- Close some filetypes with <q>
augroup("CloseWithQ", { clear = true })
autocmd("FileType", {
	group = "CloseWithQ",
	pattern = { "help", "lspinfo", "man", "qf", "query" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
	end,
})
