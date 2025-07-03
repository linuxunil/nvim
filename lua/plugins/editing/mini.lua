-- lua/plugins/mini.lua (Optimized - removed mini.bufremove, fixed icons loading)
return {
  -- Mini.icons - Load immediately for UI components
  {
    "echasnovski/mini.icons",
    version = false,
    lazy = false,   -- Load immediately for UI icons
    priority = 900, -- Load early for other plugins
    opts = {
      style = "glyph",
      extension = {
        go = { glyph = "󰟓", hl = "MiniIconsBlue" },
        zig = { glyph = "⚡", hl = "MiniIconsOrange" },
        py = { glyph = "󰌠", hl = "MiniIconsYellow" },
        js = { glyph = "󰌞", hl = "MiniIconsYellow" },
        ts = { glyph = "󰛦", hl = "MiniIconsBlue" },
        lua = { glyph = "󰢱", hl = "MiniIconsBlue" },
        md = { glyph = "󰍔", hl = "MiniIconsGrey" },
        json = { glyph = "󰘦", hl = "MiniIconsYellow" },
        yaml = { glyph = "󰈙", hl = "MiniIconsOrange" },
        yml = { glyph = "󰈙", hl = "MiniIconsOrange" },
        toml = { glyph = "󰈙", hl = "MiniIconsOrange" },
        dockerfile = { glyph = "󰡨", hl = "MiniIconsBlue" },
      },
      filetype = {
        go = { glyph = "󰟓", hl = "MiniIconsBlue" },
        zig = { glyph = "⚡", hl = "MiniIconsOrange" },
        python = { glyph = "󰌠", hl = "MiniIconsYellow" },
        javascript = { glyph = "󰌞", hl = "MiniIconsYellow" },
        typescript = { glyph = "󰛦", hl = "MiniIconsBlue" },
        lua = { glyph = "󰢱", hl = "MiniIconsBlue" },
        markdown = { glyph = "󰍔", hl = "MiniIconsGrey" },
        json = { glyph = "󰘦", hl = "MiniIconsYellow" },
        yaml = { glyph = "󰈙", hl = "MiniIconsOrange" },
        dockerfile = { glyph = "󰡨", hl = "MiniIconsBlue" },
      },
      file = {
        ["go.mod"] = { glyph = "󰟓", hl = "MiniIconsBlue" },
        ["go.sum"] = { glyph = "󰟓", hl = "MiniIconsBlue" },
        ["build.zig"] = { glyph = "⚡", hl = "MiniIconsOrange" },
        ["pyproject.toml"] = { glyph = "󰌠", hl = "MiniIconsYellow" },
        ["package.json"] = { glyph = "󰌞", hl = "MiniIconsYellow" },
        ["tsconfig.json"] = { glyph = "󰛦", hl = "MiniIconsBlue" },
        [".env"] = { glyph = "󰙩", hl = "MiniIconsYellow" },
        [".gitignore"] = { glyph = "󰊢", hl = "MiniIconsRed" },
        ["README.md"] = { glyph = "󰍔", hl = "MiniIconsGrey" },
        ["Dockerfile"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
      },
    },
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- Mini.ai - Better text objects
  {
    "echasnovski/mini.ai",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup({
        custom_textobjects = {
          o = require("mini.ai").gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      })
    end,
  },

  -- Mini.comment - Smart commenting
  {
    "echasnovski/mini.comment",
    version = false,
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },

  -- Mini.pairs - Auto pairs
  {
    "echasnovski/mini.pairs",
    version = false,
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = false, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
  },

  -- Mini.surround - Surround text objects
  {
    "echasnovski/mini.surround",
    version = false,
    keys = function(_, keys)
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add,            desc = "Add surrounding",                     mode = { "n", "v" } },
        { opts.mappings.delete,         desc = "Delete surrounding" },
        { opts.mappings.find,           desc = "Find right surrounding" },
        { opts.mappings.find_left,      desc = "Find left surrounding" },
        { opts.mappings.highlight,      desc = "Highlight surrounding" },
        { opts.mappings.replace,        desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },

  -- Mini.files - File explorer
  {
    "echasnovski/mini.files",
    version = false,
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
      options = {
        use_as_default_explorer = true,
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      local show_dotfiles = true
      local filter_show = function() return true end
      local filter_hide = function(fs_entry) return not vim.startswith(fs_entry.name, ".") end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require("mini.files").refresh({ content = { filter = new_filter } })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id, desc = "Toggle dotfiles" })
        end,
      })
    end,
  },

  -- Note: Removed mini.bufremove - now using snacks.nvim bufdelete

  -- Mini.indentscope - Indent guides
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help", "alpha", "dashboard", "neo-tree", "Trouble", "trouble",
          "lazy", "mason", "notify", "toggleterm", "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- Mini.move - Move lines and blocks
  {
    "echasnovski/mini.move",
    version = false,
    keys = {
      { "<M-h>", mode = { "n", "v" }, desc = "Move left" },
      { "<M-j>", mode = { "n", "v" }, desc = "Move down" },
      { "<M-k>", mode = { "n", "v" }, desc = "Move up" },
      { "<M-l>", mode = { "n", "v" }, desc = "Move right" },
    },
    opts = {
      mappings = {
        left = "<M-h>",
        right = "<M-l>",
        down = "<M-j>",
        up = "<M-k>",
        line_left = "<M-h>",
        line_right = "<M-l>",
        line_down = "<M-j>",
        line_up = "<M-k>",
      },
    },
  },

  -- Mini.jump - Enhanced f/F/t/T
  {
    "echasnovski/mini.jump",
    version = false,
    keys = { "f", "F", "t", "T" },
    opts = {
      mappings = {
        forward = "f",
        backward = "F",
        forward_till = "t",
        backward_till = "T",
        repeat_jump = ";",
      },
      delay = {
        highlight = 250,
        idle_stop = 10000000, -- Very large value to effectively disable
      },
    },
  },
}
