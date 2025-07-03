-- lua/autocmds.lua (Enhanced with Zig and Go support)
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

-- Go-specific settings
augroup("GoSettings", { clear = true })
autocmd("FileType", {
  group = "GoSettings",
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false -- Go uses tabs
    vim.opt_local.colorcolumn = "120"
  end,
})

-- Zig-specific settings
augroup("ZigSettings", { clear = true })
autocmd("FileType", {
  group = "ZigSettings",
  pattern = "zig",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt_local.colorcolumn = "100"
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

-- Auto-detect Go module root
augroup("GoModule", { clear = true })
autocmd("BufEnter", {
  group = "GoModule",
  pattern = "*.go",
  callback = function()
    local go_mod = vim.fn.findfile("go.mod", ".;")
    if go_mod ~= "" then
      vim.cmd("cd " .. vim.fn.fnamemodify(go_mod, ":h"))
    end
  end,
})

-- Auto-detect Zig build file
augroup("ZigBuild", { clear = true })
autocmd("BufEnter", {
  group = "ZigBuild",
  pattern = "*.zig",
  callback = function()
    local build_zig = vim.fn.findfile("build.zig", ".;")
    if build_zig ~= "" then
      vim.cmd("cd " .. vim.fn.fnamemodify(build_zig, ":h"))
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

-- Auto-format on save for specific filetypes
augroup("FormatOnSave", { clear = true })
autocmd("BufWritePre", {
  group = "FormatOnSave",
  pattern = { "*.go", "*.zig", "*.lua" },
  callback = function()
    require("conform").format({ async = false, lsp_fallback = true })
  end,
})

-- Remove trailing whitespace on save
augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  group = "TrimWhitespace",
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Auto-create parent directories when saving
augroup("AutoCreateDir", { clear = true })
autocmd("BufWritePre", {
  group = "AutoCreateDir",
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
