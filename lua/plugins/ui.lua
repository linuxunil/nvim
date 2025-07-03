return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function() require("telescope").setup() end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function() require("telescope").load_extension("fzf") end,
    after = "telescope.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufWinEnter",
    config = function()
      require("bufferline").setup({ options = { show_buffer_close_icons = false } })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "frappe" })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "folke/snacks.nvim" },
    event = "VeryLazy",
    config = function()
      require("noice").setup()
      require("snacks").setup()
    end,
  },
  {
    "echasnovski/mini.files",
    cmd = "MiniFiles",
    config = function() require("mini.files").setup() end,
  },
  {
    "echasnovski/mini.comment",
    keys = { "gc" },
    config = function() require("mini.comment").setup() end,
  },
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = function() require("mini.pairs").setup() end,
  },
  {
    "echasnovski/mini.indentscope",
    event = "BufReadPre",
    config = function()
      require("mini.indentscope").setup({
        draw = { animation = require("mini.indentscope").gen_animation.none() },
      })
    end,
  },
  {
    "echasnovski/mini.bufremove",
    cmd = { "Bdelete", "Bwipeout" },
    config = function() require("mini.bufremove").setup() end,
  },
  {
    "echasnovski/mini.surround",
    keys = { "ys", "ds", "cs" },
    config = function() require("mini.surround").setup() end,
  },
  {
    "echasnovski/mini.move",
    keys = { "<M-j>", "<M-k>" },
    config = function() require("mini.move").setup() end,
  },
  {
    "echasnovski/mini.jump",
    keys = { "s", "S" },
    config = function() require("mini.jump").setup() end,
  },
}

