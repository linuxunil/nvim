return {
  {
    "Saghen/blink.cmp",
    dependencies = { "neovim/nvim-lspconfig" },
    event = "InsertEnter",
    config = function()
      require("blink").setup()
    end,
  },
}

