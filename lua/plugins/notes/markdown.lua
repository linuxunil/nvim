-- lua/plugins/markdown.lua
return {
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview", ft = "markdown" },
    },
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ""
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ""
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {}
      }
      vim.g.mkdp_markdown_css = ""
      vim.g.mkdp_highlight_css = ""
      vim.g.mkdp_port = ""
      vim.g.mkdp_page_title = "「${name}」"
      vim.g.mkdp_images_path = ""
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark"
    end,
  },

  -- Better markdown editing
  {
    "preservim/vim-markdown",
    ft = "markdown",
    dependencies = { "godlygeek/tabular" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_toml_frontmatter = 1
      vim.g.vim_markdown_json_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_new_list_item_indent = 2
      vim.g.vim_markdown_auto_insert_bullets = 1
      vim.g.vim_markdown_edit_url_in = "tab"
    end,
  },

  -- Markdown table editing
  {
    "dhruvasagar/vim-table-mode",
    ft = "markdown",
    keys = {
      { "<leader>mt", "<cmd>TableModeToggle<cr>", desc = "Toggle Table Mode", ft = "markdown" },
    },
    config = function()
      vim.g.table_mode_corner = "|"
      vim.g.table_mode_border = 0
      vim.g.table_mode_fillchar = " "
    end,
  },

  -- Markdown headings and TOC
  {
    "mzlogin/vim-markdown-toc",
    ft = "markdown",
    keys = {
      { "<leader>mT", "<cmd>GenTocGFM<cr>", desc = "Generate TOC", ft = "markdown" },
    },
    config = function()
      vim.g.vmt_auto_update_on_save = 1
      vim.g.vmt_dont_insert_fence = 1
    end,
  },

  -- Live markdown rendering in buffer
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.icons"
    },
    opts = {
      modes = { "n", "no", "c" }, -- Change these modes based on preference
      hybrid_modes = { "n" },    -- Uses this feature on normal mode

      -- This is nice to have
      callbacks = {
        on_enable = function (_, win)
          vim.wo[win].conceallevel = 2;
          vim.wo[win].concealcursor = "c";
        end
      }
    },
    keys = {
      { "<leader>mv", "<cmd>Markview toggleAll<cr>", desc = "Toggle Markview", ft = "markdown" },
    },
  },

  -- Paste images into markdown
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    ft = { "markdown", "quarto", "latex" },
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = true,
        drag_and_drop = {
          insert_mode = true,
        },
      },
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = "![$CURSOR]($FILE_PATH)",
          drag_and_drop = {
            download_images = false,
          },
        },
      },
    },
    keys = {
      { "<leader>mi", "<cmd>PasteImage<cr>", desc = "Paste Image", ft = "markdown" },
    },
  },
}
