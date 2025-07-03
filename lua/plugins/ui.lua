-- lua/plugins/ui.lua (Consolidated UI configuration)
return {
  -- Theme (loaded immediately)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false, -- Load immediately for UI
    opts = {
      flavour = "frappe",
      background = { light = "latte", dark = "mocha" },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
      dim_inactive = { enabled = true, shade = "dark", percentage = 0.15 },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        notify = true,
        mini = { enabled = true, indentscope_color = "lavender" },
        telescope = { enabled = true, style = "nvchad" },
        lsp_trouble = true,
        which_key = true,
        mason = true,
        noice = true,
        dap = { enabled = true, enable_ui = true },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-frappe")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",   desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",   desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>",    desc = "Recent files" },
      { "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
      { "<leader>fk", "<cmd>Telescope keymaps<CR>",     desc = "Keymaps" },
    },
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        path_display = { "truncate" },
        file_ignore_patterns = { ".git/", "node_modules" },
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          width = 0.87,
          height = 0.80,
        },
      },
      pickers = {
        find_files = { theme = "dropdown", previewer = false, hidden = true },
        buffers = { theme = "dropdown", previewer = false, initial_mode = "normal" },
        live_grep = { theme = "ivy" },
      },
      extensions = {
        fzf = { fuzzy = true, override_generic_sorter = true, case_mode = "smart_case" },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },

  -- Statusline (loaded immediately for UI)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons" },
    lazy = false, -- Load immediately for UI
    opts = {
      options = {
        theme = "catppuccin",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          { "filetype", icon_only = true, separator = "",                                            padding = { left = 1, right = 0 } },
          { "filename", path = 1,         symbols = { modified = "  ", readonly = "", unnamed = "" } },
        },
        lualine_x = {
          {
            function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
                  and require("noice").api.status.command.get() or ""
            end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = { fg = "#f38ba8" },
          },
          {
            function()
              return package.loaded["dap"] and require("dap").status() ~= ""
                  and "  " .. require("dap").status() or ""
            end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = { fg = "#94e2d5" },
          },
          { "diff" },
        },
        lualine_y = {
          { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = { function() return " " .. os.date("%R") end },
      },
      extensions = { "lazy" },
    },
  },

  -- Bufferline (loaded immediately for UI)
  {
    "akinsho/bufferline.nvim",
    dependencies = { "echasnovski/mini.icons" },
    lazy = false, -- Load immediately for UI
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete other buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete buffers to the right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete buffers to the left" },
      { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
      { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
    },
    opts = {
      options = {
        close_command = function(n) require("snacks").bufdelete(n) end,
        right_mouse_command = function(n) require("snacks").bufdelete(n) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = { Error = " ", Warn = " ", Info = " " }
          return (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
        end,
        offsets = {
          { filetype = "mini.files", text = "File Explorer", highlight = "Directory", text_align = "left" },
        },
      },
    },
  },

  -- Notifications (loaded immediately for UI)
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    lazy = false, -- Load immediately for UI
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = {
      ensure_installed = {
        "bash", "c", "lua", "vim", "vimdoc", "query", "regex",
        "html", "css", "javascript", "typescript", "tsx", "json", "jsonc",
        "python", "go", "zig", "rust", "java", "cpp",
        "yaml", "toml", "xml", "ini", "dockerfile", "gitignore", "gitcommit",
        "markdown", "markdown_inline", "sql",
      },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true, disable = { "python" } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Visual Enhancements
  {
    "karb94/neoscroll.nvim",
    lazy = false, -- Load immediately for smooth scrolling
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      hide_cursor = true,
      easing_function = "quadratic",
    },
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = { providers = { "lsp" } },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference" })
      end

      map("]]", "next")
      map("[[", "prev")
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    opts = {
      provider_selector = function() return { "treesitter", "indent" } end,
    },
    config = function(_, opts)
      require("ufo").setup(opts)
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = "eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸"
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        "*",
        css = { rgb_fn = true },
        html = { names = false },
      })
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "echasnovski/mini.icons" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions/references (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                            desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix List (Trouble)" },
    },
    opts = {
      modes = {
        lsp_references = { params = { include_declaration = false } },
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false, -- Load immediately for visual guides
    main = "ibl",
    opts = {
      indent = { char = "│", tab_char = "│" },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help", "alpha", "dashboard", "neo-tree", "Trouble", "trouble",
          "lazy", "mason", "notify", "toggleterm", "lazyterm",
        },
      },
    },
  },

  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>zm", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = { enabled = true, ruler = false, showcmd = false, laststatus = 0 },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
      },
    },
  },

  {
    "folke/twilight.nvim",
    opts = {
      dimming = { alpha = 0.25, color = { "Normal", "#ffffff" }, inactive = false },
      context = 10,
      treesitter = true,
      expand = { "function", "method", "table", "if_statement" },
    },
  },

  {
    "goolord/alpha-nvim",
    lazy = false,   -- Load immediately for dashboard
    priority = 999, -- Load after catppuccin
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }

      dashboard.section.footer.val = "Don't Stop Until You are Proud..."
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      alpha.setup(dashboard.opts)
    end,
  },
}
