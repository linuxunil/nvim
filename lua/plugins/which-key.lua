-- lua/plugins/which-key.lua (Updated with resolved key conflicts)
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup({
        plugins = { spelling = true },
        win = { border = "rounded" },
      })

      -- Register key mappings with resolved conflicts
      wk.add({
        -- Single character prefixes
        { "g",           group = "goto" },
        { "gs",          group = "surround" },
        { "]",           group = "next" },
        { "[",           group = "prev" },

        -- Leader key groups
        { "<leader>b",   group = "buffer" },
        { "<leader>c",   group = "code" },
        { "<leader>d",   group = "debug" },
        { "<leader>f",   group = "file/find" },
        { "<leader>g",   group = "git" },
        { "<leader>G",   group = "go" }, -- Moved Go to capital G
        { "<leader>m",   group = "markdown" },
        { "<leader>p",   group = "python" },
        { "<leader>q",   group = "quit/session" },
        { "<leader>s",   group = "search/repl" },
        { "<leader>t",   group = "test/terminal" },
        { "<leader>u",   group = "ui/toggle" },
        { "<leader>w",   group = "windows" },
        { "<leader>x",   group = "diagnostics/quickfix" },
        { "<leader>z",   group = "zig" },

        -- Sub-groups
        { "<leader>dg",  group = "debug go" },
        { "<leader>pe",  group = "python env" },

        -- File/Find
        { "<leader>ff",  desc = "Find files" },
        { "<leader>fg",  desc = "Live grep" },
        { "<leader>fb",  desc = "Buffers" },
        { "<leader>fh",  desc = "Help tags" },
        { "<leader>fr",  desc = "Recent files" },
        { "<leader>fc",  desc = "Colorscheme" },
        { "<leader>fk",  desc = "Keymaps" },

        -- File explorer
        { "<leader>e",   desc = "File explorer (current dir)" },
        { "<leader>E",   desc = "File explorer (cwd)" },

        -- Buffer management (using snacks.nvim)
        { "<leader>bd",  desc = "Delete buffer" },
        { "<leader>bD",  desc = "Delete buffer (force)" },
        { "<leader>bp",  desc = "Toggle pin" },
        { "<leader>bP",  desc = "Delete non-pinned buffers" },
        { "<leader>bo",  desc = "Delete other buffers" },
        { "<leader>br",  desc = "Delete buffers to the right" },
        { "<leader>bl",  desc = "Delete buffers to the left" },

        -- Code
        { "<leader>ca",  desc = "Code actions" },
        { "<leader>cf",  desc = "Format buffer" },
        { "<leader>cg",  desc = "Generate docstring" },
        { "<leader>cR",  desc = "Rename file" },

        -- Debug
        { "<leader>db",  desc = "Toggle breakpoint" },
        { "<leader>dc",  desc = "Continue" },
        { "<leader>dC",  desc = "Run to cursor" },
        { "<leader>dg",  desc = "Go to line (no execute)" },
        { "<leader>di",  desc = "Step into" },
        { "<leader>dj",  desc = "Down" },
        { "<leader>dk",  desc = "Up" },
        { "<leader>dl",  desc = "Show log" },
        { "<leader>do",  desc = "Step out" },
        { "<leader>dO",  desc = "Step over" },
        { "<leader>dp",  desc = "Pause" },
        { "<leader>dr",  desc = "REPL" },
        { "<leader>ds",  desc = "Session" },
        { "<leader>dt",  desc = "Terminate" },
        { "<leader>dw",  desc = "Widgets" },

        -- Git (resolved conflicts)
        { "<leader>gg",  desc = "LazyGit" },
        { "<leader>gb",  desc = "Git blame line" },
        { "<leader>gB",  desc = "Git browse" },
        { "<leader>gp",  desc = "Preview hunk" },
        { "<leader>gR",  desc = "Reset hunk" },
        { "<leader>gf",  desc = "File history" },
        { "<leader>gl",  desc = "Git log" },

        -- Go specific (moved to <leader>G*)
        { "<leader>Gr",  desc = "Run Go file" },
        { "<leader>Gt",  desc = "Test Go package" },
        { "<leader>GT",  desc = "Test Go function" },
        { "<leader>Gb",  desc = "Build Go project" },
        { "<leader>Gc",  desc = "Go coverage" },
        { "<leader>Gf",  desc = "Format Go file" },
        { "<leader>Gi",  desc = "Go imports" },
        { "<leader>Gm",  desc = "Go mod tidy" },
        { "<leader>Ga",  desc = "Add Go test" },
        { "<leader>Gd",  desc = "Go documentation" },
        { "<leader>Gv",  desc = "Go vet" },
        { "<leader>Gl",  desc = "Go lint" },

        -- Python specific
        { "<leader>pr",  desc = "Run Python file with UV" },
        { "<leader>pt",  desc = "Run tests with UV" },
        { "<leader>pi",  desc = "Install package with UV" },
        { "<leader>ps",  desc = "Sync dependencies with UV" },
        { "<leader>pv",  desc = "Create virtual environment" },
        { "<leader>pc",  desc = "Check code with Ruff" },
        { "<leader>pf",  desc = "Format code with Ruff" },
        { "<leader>pev", desc = "Select Python environment" },
        { "<leader>pR",  desc = "Start Python REPL" },
        { "<leader>pS",  desc = "Send file to REPL" },
        { "<leader>pm",  desc = "Send marked text to REPL" },

        -- Zig specific
        { "<leader>zr",  desc = "Run Zig file" },
        { "<leader>zt",  desc = "Test Zig file" },
        { "<leader>zb",  desc = "Build Zig project" },
        { "<leader>zf",  desc = "Format Zig file" },
        { "<leader>zc",  desc = "Check Zig file" },
        { "<leader>zi",  desc = "Initialize Zig project" },
        { "<leader>zm",  desc = "Zen mode" },

        -- Terminal (using snacks.nvim, resolved conflicts)
        { "<leader>th",  desc = "Terminal horizontal" },
        { "<leader>tv",  desc = "Terminal vertical" },
        { "<leader>tt",  desc = "Terminal toggle" },

        -- Test (resolved <leader>tf conflict)
        { "<leader>tT",  desc = "Run file tests" },
        { "<leader>td",  desc = "Debug nearest test" },
        { "<leader>ts",  desc = "Test summary" },
        { "<leader>to",  desc = "Test output" },

        -- Markdown specific
        { "<leader>mp",  desc = "Markdown preview" },
        { "<leader>mt",  desc = "Toggle table mode" },
        { "<leader>mT",  desc = "Generate TOC" },
        { "<leader>mv",  desc = "Toggle markview" },
        { "<leader>mi",  desc = "Paste image" },

        -- UI/Toggle
        { "<leader>un",  desc = "Dismiss notifications" },
        { "<leader>us",  desc = "Toggle spelling" },
        { "<leader>uw",  desc = "Toggle wrap" },
        { "<leader>uL",  desc = "Toggle relative numbers" },
        { "<leader>ud",  desc = "Toggle diagnostics" },
        { "<leader>ul",  desc = "Toggle line numbers" },
        { "<leader>uc",  desc = "Toggle conceal" },
        { "<leader>uT",  desc = "Toggle treesitter" },
        { "<leader>ub",  desc = "Toggle background" },
        { "<leader>uh",  desc = "Toggle inlay hints" },

        -- Diagnostics/Quickfix
        { "<leader>xx",  desc = "Diagnostics (Trouble)" },
        { "<leader>xX",  desc = "Buffer Diagnostics (Trouble)" },
        { "<leader>cs",  desc = "Symbols (Trouble)" },
        { "<leader>cl",  desc = "LSP Definitions/references (Trouble)" },
        { "<leader>xL",  desc = "Location List (Trouble)" },
        { "<leader>xQ",  desc = "Quickfix List (Trouble)" },

        -- Utilities
        { "<leader>N",   desc = "Neovim News" },
        { "<c-/>",       desc = "Toggle terminal" },
        { "<c-_>",       desc = "Toggle terminal" },

        -- LSP mappings
        { "gd",          desc = "Go to definition" },
        { "gD",          desc = "Go to declaration" },
        { "gr",          desc = "References" },
        { "gi",          desc = "Go to implementation" },
        { "K",           desc = "Hover documentation" },
        { "<leader>rn",  desc = "Rename" },
        { "<leader>d",   desc = "Show diagnostics" },
        { "[d",          desc = "Previous diagnostic" },
        { "]d",          desc = "Next diagnostic" },
        { "]g",          desc = "Next git hunk" },
        { "[g",          desc = "Previous git hunk" },

        -- Buffer navigation
        { "<S-h>",       desc = "Previous buffer" },
        { "<S-l>",       desc = "Next buffer" },
        { "[b",          desc = "Previous buffer" },
        { "]b",          desc = "Next buffer" },

        -- Treesitter text objects navigation
        { "]f",          desc = "Next function" },
        { "[f",          desc = "Previous function" },
        { "]c",          desc = "Next class" },
        { "[c",          desc = "Previous class" },
        { "]F",          desc = "Next function end" },
        { "[F",          desc = "Previous function end" },
        { "]C",          desc = "Next class end" },
        { "[C",          desc = "Previous class end" },

        -- Mini.surround
        { "gsa",         desc = "Add surrounding",                     mode = { "n", "v" } },
        { "gsd",         desc = "Delete surrounding" },
        { "gsf",         desc = "Find surrounding (right)" },
        { "gsF",         desc = "Find surrounding (left)" },
        { "gsh",         desc = "Highlight surrounding" },
        { "gsr",         desc = "Replace surrounding" },
        { "gsn",         desc = "Update n_lines" },

        -- Mini.move
        { "<M-h>",       desc = "Move left",                           mode = { "n", "v" } },
        { "<M-j>",       desc = "Move down",                           mode = { "n", "v" } },
        { "<M-k>",       desc = "Move up",                             mode = { "n", "v" } },
        { "<M-l>",       desc = "Move right",                          mode = { "n", "v" } },

        -- Mini.jump
        { "f",           desc = "Jump forward" },
        { "F",           desc = "Jump backward" },
        { "t",           desc = "Jump till forward" },
        { "T",           desc = "Jump till backward" },
        { ";",           desc = "Repeat jump" },

        -- Word navigation
        { "]]",          desc = "Next Reference" },
        { "[[",          desc = "Prev Reference" },
      })
    end,
  },
}
