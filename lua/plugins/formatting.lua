-- lua/plugins/formatting.lua (Enhanced with Zig and Go support)
return {
  {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        -- Lua
        lua = { "stylua" },

        -- Go
        go = { "goimports", "gofumpt" },

        -- Zig
        zig = { "zig_fmt" },

        -- Python
        python = { "ruff_format", "ruff_organize_imports" },

        -- Web technologies
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },

        -- Markup and data
        json = { { "prettierd", "prettier" } },
        jsonc = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        toml = { "taplo" },

        -- Other
        sql = { "sqlfluff" },
        dockerfile = { "dockfmt" },
        bash = { "shfmt" },
        sh = { "shfmt" },
      },
      format_on_save = function(bufnr)
        -- Disable format on save for certain filetypes
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return {
          timeout_ms = 1000,
          lsp_fallback = true,
        }
      end,
      formatters = {
        -- Zig formatter
        zig_fmt = {
          command = "zig",
          args = { "fmt", "--stdin" },
          stdin = true,
        },

        -- Go formatters
        goimports = {
          command = "goimports",
          args = { "-w", "$FILENAME" },
          stdin = false,
        },
        gofumpt = {
          command = "gofumpt",
          args = { "-w", "$FILENAME" },
          stdin = false,
        },

        -- Python formatters
        ruff_format = {
          command = "ruff",
          args = { "format", "--stdin-filename", "$FILENAME", "-" },
          stdin = true,
        },
        ruff_organize_imports = {
          command = "ruff",
          args = { "check", "--select", "I", "--fix", "--stdin-filename", "$FILENAME", "-" },
          stdin = true,
        },

        -- SQL formatter
        sqlfluff = {
          command = "sqlfluff",
          args = { "format", "--dialect=postgres", "-" },
          stdin = true,
        },

        -- Shell formatter
        shfmt = {
          command = "shfmt",
          args = { "-i", "2", "-ci", "-bn" },
          stdin = true,
        },
      },
    },
  },
}
