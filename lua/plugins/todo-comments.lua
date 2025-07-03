-- lua/plugins/todo-comments.lua (Todo highlighting and management)
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      -- Todo navigation
      { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },

      -- Todo search and management
      { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
    },
    opts = {
      signs = true,      -- Show icons in the signs column
      sign_priority = 8, -- Sign priority
      keywords = {
        FIX = {
          icon = " ",                                 -- Icon used for the sign, and in search results
          color = "error",                            -- Can be a hex color, or a named color
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- A set of other keywords that all map to this FIX keywords
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE",                     -- The gui style to use for the fg highlight group
        bg = "BOLD",                     -- The gui style to use for the bg highlight group
      },
      merge_keywords = true,             -- When true, custom keywords will be merged with the defaults
      highlight = {
        multiline = true,                -- Enable multine todo comments
        multiline_pattern = "^.",        -- Lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10,          -- Extra lines of context to show for multiline comments
        before = "",                     -- "fg" or "bg" or empty
        keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty
        after = "fg",                    -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- Pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,            -- Uses treesitter to match keywords in comments only
        max_line_len = 400,              -- Ignore lines longer than this
        exclude = {},                    -- List of file types to exclude highlighting
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF006E" }
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], -- Ripgrep regex pattern
      },
    },
    config = function(_, opts)
      require("todo-comments").setup(opts)

      -- Auto-highlight todo comments on file read
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
        pattern = "*",
        callback = function()
          require("todo-comments").setup(opts)
        end,
      })
    end,
  },
}
