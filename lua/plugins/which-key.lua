-- lua/plugins/which-key.lua
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup({
        plugins = {
          spelling = true,
        },
        window = {
          border = "rounded",
        },
      })

      -- Register key mappings
      wk.register({
        ["g"] = { name = "+goto" },
        ["gs"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
      })

      wk.register({
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>d"] = { name = "+debug" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git/go" },
        ["<leader>p"] = { name = "+python" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search/repl" },
        ["<leader>t"] = { name = "+test/terminal" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>z"] = { name = "+zig/zen" },
      })

      -- Sub-groups
      wk.register({
        ["<leader>dg"] = { name = "+debug go" },
        ["<leader>gh"] = { name = "+git hunks" },
        ["<leader>pe"] = { name = "+python env" },
      })
    end,
  },
}
