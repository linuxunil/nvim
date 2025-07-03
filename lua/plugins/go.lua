-- lua/plugins/go.lua (Complete rewrite - comprehensive Go development)
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
      -- Go execution and building (using <leader>G* to avoid git conflicts)
      { "<leader>Gr", "<cmd>GoRun<cr>",           desc = "Run Go file",                ft = "go" },
      { "<leader>GR", "<cmd>GoRun %<cr>",         desc = "Run current Go file",        ft = "go" },
      { "<leader>Gb", "<cmd>GoBuild<cr>",         desc = "Build Go project",           ft = "go" },
      { "<leader>GB", "<cmd>GoBuild %<cr>",       desc = "Build current Go file",      ft = "go" },

      -- Go testing
      { "<leader>Gt", "<cmd>GoTest<cr>",          desc = "Run Go tests",               ft = "go" },
      { "<leader>GT", "<cmd>GoTestFunc<cr>",      desc = "Test function under cursor", ft = "go" },
      { "<leader>Ga", "<cmd>GoTestFile<cr>",      desc = "Test current file",          ft = "go" },
      { "<leader>GA", "<cmd>GoTestPkg<cr>",       desc = "Test package",               ft = "go" },
      { "<leader>Gc", "<cmd>GoCoverage<cr>",      desc = "Show test coverage",         ft = "go" },
      { "<leader>GC", "<cmd>GoCoverageClear<cr>", desc = "Clear coverage",             ft = "go" },

      -- Go formatting and imports
      { "<leader>Gf", "<cmd>GoFmt<cr>",           desc = "Format Go code",             ft = "go" },
      { "<leader>Gi", "<cmd>GoImports<cr>",       desc = "Organize imports",           ft = "go" },
      { "<leader>GI", "<cmd>GoImport<cr>",        desc = "Add import",                 ft = "go" },

      -- Go tools and utilities
      { "<leader>Gm", "<cmd>GoMod<cr>",           desc = "Go mod tidy",                ft = "go" },
      { "<leader>GM", "<cmd>GoModInit<cr>",       desc = "Go mod init",                ft = "go" },
      { "<leader>Gv", "<cmd>GoVet<cr>",           desc = "Go vet",                     ft = "go" },
      { "<leader>Gl", "<cmd>GoLint<cr>",          desc = "Go lint",                    ft = "go" },
      { "<leader>Gd", "<cmd>GoDoc<cr>",           desc = "Go documentation",           ft = "go" },

      -- Go code generation
      { "<leader>Gs", "<cmd>GoFillStruct<cr>",    desc = "Fill struct",                ft = "go" },
      { "<leader>GS", "<cmd>GoFillSwitch<cr>",    desc = "Fill switch",                ft = "go" },
      { "<leader>Ge", "<cmd>GoIfErr<cr>",         desc = "Add if err",                 ft = "go" },
      { "<leader>GE", "<cmd>GoAddTest<cr>",       desc = "Add test for function",      ft = "go" },

      -- Go tags and interface
      { "<leader>Gj", "<cmd>GoAddTag<cr>",        desc = "Add struct tags",            ft = "go" },
      { "<leader>GJ", "<cmd>GoRmTag<cr>",         desc = "Remove struct tags",         ft = "go" },
      { "<leader>Go", "<cmd>GoImpl<cr>",          desc = "Implement interface",        ft = "go" },

      -- Go navigation
      { "<leader>Gn", "<cmd>GoAlt<cr>",           desc = "Switch to test file",        ft = "go" },
      { "<leader>GN", "<cmd>GoAltV<cr>",          desc = "Switch to test (vertical)",  ft = "go" },
    },
    config = function()
      require("go").setup({
        -- Go tooling configuration
        go = "go",           -- go command, can be go[default] or go1.18beta1
        goimports = "gopls", -- goimports command, can be gopls[default] or goimports or gofumpt
        gofmt = "gofumpt",   -- gofmt through gopls: alternative is gofumpt, goimports, golines, gofmt, etc

        -- Formatting options
        max_line_len = 120,             -- max line length in golines format, Target line length for golines
        tag_transform = false,          -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
        tag_options = "json=omitempty", -- sets options sent to gomodifytags, i.e., json=omitempty
        gotests_template = "",          -- sets gotests -template parameter (check gotests for details)
        gotests_template_dir = "",      -- sets gotests -template_dir parameter (check gotests for details)

        -- Comment and documentation
        comment_placeholder = "   ", -- comment_placeholder your cool placeholder e.g. 󰟓
        icons = { breakpoint = "🧘", currentpos = "🏃" }, -- setup to `false` to disable icons setup
        verbose = false, -- output loginf in messages

        -- LSP configuration
        lsp_cfg = true,                                     -- true: use non-default gopls setup specified in go/lsp.lua
        lsp_gofumpt = true,                                 -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = true,                               -- use on_attach from go.nvim
        lsp_keymaps = true,                                 -- set to false to disable gopls/lsp keymap
        lsp_codelens = true,                                -- set to false to disable codelens, true by default, you can use a function
        lsp_diag_hdlr = true,                               -- hook lsp diag handler and send diag to quickfix
        lsp_diag_underline = true,
        lsp_diag_virtual_text = { space = 0, prefix = "" }, -- virtual text setup
        lsp_diag_signs = true,
        lsp_diag_update_in_insert = false,
        lsp_document_formatting = true,
        lsp_inlay_hints = {
          enable = true,
          only_current_line = false,
          only_current_line_autocmd = "CursorHold",
          show_variable_name = true,
          parameter_hints_prefix = "󰊕 ",
          show_parameter_hints = true,
          other_hints_prefix = "=> ",
        },

        -- DAP (Debug Adapter Protocol) configuration
        dap_debug = true,                                              -- set to false to disable dap
        dap_debug_keymap = true,                                       -- true: use keymap for debugger defined in go/dap.lua
        dap_debug_gui = {},                                            -- bool|table put your dap-ui setup here set to false to disable
        dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

        -- Build and test configuration
        build_tags = "tag1,tag2", -- set default build tags
        textobjects = true,       -- enable default text objects through treesittter-text-objects
        test_runner = "go",       -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
        verbose_tests = true,     -- set to add verbose flag to tests
        run_in_floaterm = false,  -- set to true to run in a float window. :GoTermClose closes the floatterm
        floaterm = {              -- position
          posititon = "auto",     -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
          width = 0.45,           -- width of float window if not auto
          height = 0.98,          -- height of float window if not auto
        },

        -- Trouble integration
        trouble = true,  -- true: use trouble to open quickfix
        test_efm = true, -- errorformat for quickfix, default mix mode, set to true will be efm only

        -- Additional tools
        luasnip = true,            -- enable included luasnip snippets. you can also disable the whole thing
        username = "",             -- fill in the username for the template
        update_tool = "go get -u", -- tool to update dependencies, can be go get -u, go mod tidy or any custom command

        -- Auto commands
        auto_format = true, -- auto format on save
        auto_lint = false,  -- auto lint on save (can be slow)
      })

      -- Auto commands for Go development
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
    end,
  },

  -- Go debugging support
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    keys = {
      { "<leader>dgt", function() require('dap-go').debug_test() end,    desc = "Debug Go test",      ft = "go" },
      { "<leader>dgl", function() require('dap-go').debug_last() end,    desc = "Debug last Go test", ft = "go" },
      { "<leader>dgr", function() require('dap-go').debug_restart() end, desc = "Debug restart",      ft = "go" },
    },
    config = function()
      require('dap-go').setup({
        -- Additional dap configurations can be added.
        -- dap_configurations accepts a list of tables where each entry
        -- represents a dap configuration. For more details do:
        -- :help dap-configuration
        dap_configurations = {
          {
            -- Must be "go" or it will be ignored by the plugin
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        -- delve configurations
        delve = {
          -- the path to the executable dlv which will be used for debugging.
          -- by default, this is the "dlv" executable on your PATH.
          path = "dlv",
          -- time to wait for delve to initialize the debug session.
          -- default to 20 seconds
          initialize_timeout_sec = 20,
          -- a string that defines the port to start delve debugger.
          -- default to string "${port}" which instructs nvim-dap
          -- to start the process in a random available port
          port = "${port}",
          -- additional args to pass to dlv
          args = {},
          -- the build flags that are passed to delve.
          -- defaults to empty string, but can be used to provide flags
          -- such as "-tags=unit" to make sure the test suite is
          -- compiled with the same flags as the tests.
          build_flags = "",
          -- whether the dlv process to be created detached or not. there is
          -- an issue on Windows where this needs to be set to false
          -- otherwise the dlv process will not be created properly.
          detached = vim.fn.has("win32") == 0,
          -- the current working directory to run dlv from, if other than
          -- the current working directory.
          cwd = nil,
        },
        -- options related to running closest test
        tests = {
          -- enables verbosity when running the test.
          verbose = false,
        },
      })
    end,
  },
}
