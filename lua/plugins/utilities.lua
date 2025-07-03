return {
  {
    "ThePrimeagen/refactoring.nvim",
    keys = { "<leader>rr" },
    config = function()
      require("refactoring").setup()
    end,
  },
}

