return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function() require("mason").setup({ PATH = "append" }) end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "html", "sqlls", "lua_ls" },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        { textDocument = { completion = { completionItem = { snippetSupport = true } } } }
      )
      local servers = { "gopls", "html", "sqlls", "lua_ls" }
      for _, server in ipairs(servers) do
        local opts = { capabilities = capabilities }
        if server == "lua_ls" then
          opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
        end
        lspconfig[server].setup(opts)
      end
    end,
  },
}

