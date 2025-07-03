-- lua/plugins/mini-icons.lua
return {
  -- Mini.icons - Better icon support
  {
    "echasnovski/mini.icons",
    version = false,
    opts = {
      -- Icon style
      style = "glyph", -- 'glyph' or 'ascii'

      -- Customize specific icons
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
        [".env.local"] = { glyph = "󰙩", hl = "MiniIconsYellow" },
        [".gitignore"] = { glyph = "󰊢", hl = "MiniIconsRed" },
        ["README.md"] = { glyph = "󰍔", hl = "MiniIconsGrey" },
        ["Dockerfile"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
        ["docker-compose.yml"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
        ["docker-compose.yaml"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
      },

      -- Customize LSP and diagnostic icons
      lsp = {
        ellipsis_char = "…",
        file = { glyph = "󰈙", hl = "MiniIconsGrey" },
        folder = { glyph = "󰉋", hl = "MiniIconsBlue" },
        folderopen = { glyph = "󰝰", hl = "MiniIconsBlue" },
      },
    },
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  }
}
