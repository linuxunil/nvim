-- lua/plugins/go.lua
return {
  -- Go language support
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod", "gowork", "gotmpl" },
    build = ':lua require("go.install").update_all_sync()',
    keys = {
      { "<leader>gr", "<cmd>GoRun<cr>",      desc = "Run Go file",      ft = "go" },
      { "<leader>gt", "<cmd>GoTest<cr>",     desc = "Test Go package",  ft = "go" },
      { "<leader>gT", "<cmd>GoTestFunc<cr>", desc = "Test Go function", ft = "go" },
      { "<leader>gb", "<cmd>GoBuild<cr>",    desc = "Build Go project", ft = "go" },
      { "<leader>gc", "<cmd>GoCoverage<cr>", desc = "Go coverage",      ft = "go" },
      { "<leader>gf", "<cmd>GoFmt<cr>",      desc = "Format Go file",   ft = "go" },
      { "<leader>gi", "<cmd>GoImports<cr>",  desc = "Go imports",       ft = "go" },
      { "<leader>gm", "<cmd>GoMod<cr>",      desc = "Go mod tidy",      ft = "go" },
      { "<leader>ga", "<cmd>GoAddTest<cr>",  desc = "Add Go test",      ft = "go" },
      { "<leader>gd", "<cmd>GoDoc<cr>",      desc = "Go documentation", ft = "go" },
      { "<leader>gv", "<cmd>GoVet<cr>",      desc = "Go vet",           ft = "go" },
      { "<leader>gl", "<cmd>GoLint<cr>",     desc = "Go lint",          ft = "go" },
    },
    config = function()
      require("go").setup({
        goimports = "gopls", -- Use gopls for imports
        gofmt = "gofumpt", -- Use gofumpt for formatting
        max_line_len = 120,
        tag_transform = false,
        test_dir = "",
        comment_placeholder = "   ",
        lsp_cfg = true, -- Auto setup LSP
        lsp_gofumpt = true,
        lsp_on_attach = true,
        dap_debug = true,
        dap_debug_gui = true,
        textobjects = true,
        test_runner = "go", -- or "richgo", "dlv", "ginkgo"
        verbose_tests = true,
        run_in_floaterm = false,
        luasnip = true,
        trouble = true,
        test_efm = true,
      })
    end,
  },

  -- Go debugging
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    keys = {
      { "<leader>dgt", function() require("dap-go").debug_test() end, desc = "Debug Go test",      ft = "go" },
      { "<leader>dgl", function() require("dap-go").debug_last() end, desc = "Debug last Go test", ft = "go" },
    },
    config = function()
      require("dap-go").setup()
    end,
  },

  -- Go struct tags
  {
    "fatih/vim-go",
    ft = "go",
    build = ":GoUpdateBinaries",
    config = function()
      vim.g.go_fmt_command = "gofumpt"
      vim.g.go_def_mapping_enabled = 0
      vim.g.go_doc_keywordprg_enabled = 0
      vim.g.go_code_completion_enabled = 0
      vim.g.go_gopls_enabled = 0
      vim.g.go_template_autocreate = 0
    end,
  },
}
