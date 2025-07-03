return {
  {
    "mfussenegger/nvim-dap",
    cmd = { "DapContinue", "DapToggleBreakpoint", "DapStepOver" },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
    },
    event = "BufRead",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-go")(),
        },
      })
    end,
  },
  {
    "nvim-neotest/neotest-go",
    ft = "go",
  },
}

