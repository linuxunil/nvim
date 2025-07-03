return {
  {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "golines" },
        lua = { "stylua" },
        sql = { "sqlfluff" },
        html = { "prettier" },
        css = { "prettier" },
        javascript = { "prettier" },
        htmldjango = { "prettier" },
      },
      format_on_save = function(bufnr)
        local ignore = vim.tbl_contains({ "lazy" }, vim.fn.bufname(bufnr))
        return not ignore
      end,
      notify_on_error = true,
      log_level = vim.log.levels.WARN,
    },
    config = function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf, lsp_fallback = true })
        end,
      })
    end,
  },
}
