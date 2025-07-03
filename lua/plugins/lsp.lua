-- lua/plugins/lsp.lua (Fixed without schemastore dependency)
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        PATH = "append",
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",    -- Go
          "html",     -- HTML
          "sqlls",    -- SQL
          "lua_ls",   -- Lua
          "zls",      -- Zig Language Server
          "pyright",  -- Python
          "ruff",     -- Python linter/formatter
          "ts_ls",    -- TypeScript/JavaScript
          "jsonls",   -- JSON
          "yamlls",   -- YAML
          "dockerls", -- Dockerfile
          "taplo",    -- TOML
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Common LSP settings
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Disable semantic tokens for better performance
        client.server_capabilities.semanticTokensProvider = nil
      end

      -- Server configurations
      local servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                unusedwrite = true,
              },
              staticcheck = true,
              usePlaceholders = true,
              completeUnimported = true,
              gofumpt = true,
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                  "${3rd}/luv/library",
                  "${3rd}/busted/library",
                },
              },
              completion = { callSnippet = "Replace" },
              diagnostics = { globals = { "vim" } },
              telemetry = { enable = false },
            },
          },
        },
        zls = {
          settings = {
            zls = {
              enable_snippets = true,
              enable_ast_check_diagnostics = true,
              enable_autofix = true,
              enable_import_embedfile_argument_completions = true,
              warn_style = true,
              highlight_global_var_declarations = true,
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              args = {
                "--line-length=88",
                "--extend-select=I",
              },
            },
          },
        },
        html = {},
        sqlls = {},
        ts_ls = {},
        jsonls = {
          settings = {
            json = {
              validate = { enable = true },
              -- Basic JSON schema support without schemastore
              schemas = {
                {
                  fileMatch = { "package.json" },
                  url = "https://json.schemastore.org/package.json",
                },
                {
                  fileMatch = { "tsconfig*.json" },
                  url = "https://json.schemastore.org/tsconfig.json",
                },
                {
                  fileMatch = { ".prettierrc", ".prettierrc.json" },
                  url = "https://json.schemastore.org/prettierrc.json",
                },
                {
                  fileMatch = { ".eslintrc", ".eslintrc.json" },
                  url = "https://json.schemastore.org/eslintrc.json",
                },
              },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://json.schemastore.org/github-action.json"] = "/.github/action.{yml,yaml}",
                ["https://json.schemastore.org/docker-compose.json"] = "/*docker-compose*.{yml,yaml}",
                ["https://json.schemastore.org/chart.json"] = "/Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2.json"] = "/.github/dependabot.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci.json"] = "/.gitlab-ci.{yml,yaml}",
                ["https://json.schemastore.org/travis.json"] = "/.travis.{yml,yaml}",
                ["https://json.schemastore.org/codecov.json"] = "/codecov.{yml,yaml}",
                ["https://json.schemastore.org/circleci.json"] = "/.circleci/**/*.{yml,yaml}",
                ["https://json.schemastore.org/pre-commit-config.json"] = "/.pre-commit-config.{yml,yaml}",
              },
            },
          },
        },
        dockerls = {},
        taplo = {},
      }

      -- Setup servers
      for server, config in pairs(servers) do
        config.capabilities = capabilities
        config.on_attach = on_attach
        lspconfig[server].setup(config)
      end

      -- Global LSP settings
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          source = "if_many",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- Custom diagnostic signs
      local signs = { Error = "󰅚", Warn = "󰀪", Hint = "󰌶", Info = "󰋽" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
}
