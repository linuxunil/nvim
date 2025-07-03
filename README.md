# 🚀 Modern Neovim Configuration

A highly optimized, low cognitive load Neovim configuration designed for multi-language development with Go, Zig, Python, and web technologies.

## ✨ Features

- **🔥 Zero-config setup** - Language servers auto-install and configure
- **⚡ Fast startup** - Lazy loading for optimal performance
- **🎯 Consistent keybindings** - Unified patterns across all languages
- **🔧 Smart project detection** - Auto-detects and configures project environments
- **📝 Format-on-save** - Automatic code formatting with industry standards
- **🐛 Integrated debugging** - DAP support for Go and Python
- **🔍 Powerful search** - Telescope with fuzzy finding and live grep
- **🎨 Modern UI** - Catppuccin theme with bufferline, statusline, and notifications

## 🛠️ Supported Languages

| Language | LSP | Formatter | Debugger | Test Runner |
|----------|-----|-----------|----------|-------------|
| **Go** | gopls | gofumpt, goimports | ✅ | go test, neotest |
| **Zig** | zls | zig fmt | ✅ | zig test |
| **Python** | pyright, ruff | ruff format | ✅ | pytest, neotest |
| **Lua** | lua_ls | stylua | - | - |
| **JavaScript/TypeScript** | ts_ls | prettier | - | - |
| **JSON/YAML/TOML** | Multiple | prettier, taplo | - | - |
| **SQL** | sqlls | sqlfluff | - | - |

## 📦 Installation

### Prerequisites
- Neovim 0.9+
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- `ripgrep` for Telescope search
- Language-specific tools (Go, Zig, Python UV, Node.js)
- `make` for telescope-fzf-native compilation

### Quick Setup
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this configuration
git clone <your-repo> ~/.config/nvim

# Start Neovim - plugins will auto-install
nvim
```

### First Launch
1. Plugins will automatically install via lazy.nvim
2. Language servers install automatically via Mason
3. Formatters and tools auto-install via Mason
4. Restart Neovim after initial setup completes

### Post-Installation
```bash
# Check health
:checkhealth

# Verify Mason installations
:Mason

# Update everything
:Lazy sync
:TSUpdate
```

## 🎯 Keybindings

### Core Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>` | Leader key | Main prefix for commands |
| `<leader>ff` | Find files | Telescope file finder |
| `<leader>fg` | Live grep | Search in files |
| `<leader>fb` | Buffers | Open buffer list |
| `<leader>fh` | Help tags | Search help documentation |
| `<leader>fr` | Recent files | Recently opened files |
| `<leader>e` | File explorer | Open mini.files (current file dir) |
| `<leader>E` | File explorer (cwd) | Open mini.files (working dir) |
| `Shift+h/l` | Buffer nav | Previous/next buffer |

### LSP & Code
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to definition | Jump to definition |
| `gr` | References | Show references |
| `K` | Hover docs | Show documentation |
| `<leader>ca` | Code actions | Available code actions |
| `<leader>rn` | Rename | Rename symbol |
| `<leader>cf` | Format | Format current buffer |
| `[d` / `]d` | Diagnostics | Previous/next diagnostic |

### Language-Specific Commands

#### Go (`<leader>g`)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gr` | Run | Execute current Go file |
| `<leader>gt` | Test | Run tests in package |
| `<leader>gT` | Test func | Run test under cursor |
| `<leader>gb` | Build | Build Go project |
| `<leader>gf` | Format | Format Go file |
| `<leader>gi` | Imports | Organize imports |
| `<leader>gc` | Coverage | Show test coverage |

#### Zig (`<leader>z`)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>zr` | Run | Execute current Zig file |
| `<leader>zt` | Test | Run Zig tests |
| `<leader>zb` | Build | Build Zig project |
| `<leader>zf` | Format | Format Zig file |
| `<leader>zc` | Check | Check Zig syntax |

#### Python (`<leader>p`)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>pr` | Run | Execute with UV |
| `<leader>pt` | Test | Run pytest |
| `<leader>pc` | Check | Ruff linting |
| `<leader>pf` | Format | Ruff formatting |
| `<leader>ps` | Sync | UV dependency sync |
| `<leader>pv` | Virtual env | Create venv |

### Terminal & Git
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>th` | Terminal horizontal | Open horizontal terminal |
| `<leader>tv` | Terminal vertical | Open vertical terminal |
| `<leader>tf` | Terminal float | Open floating terminal |
| `<leader>gg` | LazyGit | Open LazyGit interface |
| `]g` / `[g` | Git hunks | Next/previous git hunk |

### Mini.nvim Text Objects & Movement
| Key | Action | Description |
|-----|--------|-------------|
| `gsa` | Add surrounding | Add surrounding characters |
| `gsd` | Delete surrounding | Delete surrounding characters |
| `gsr` | Replace surrounding | Replace surrounding characters |
| `<leader>bd` | Delete buffer | Smart buffer deletion with save prompt |
| `<leader>bD` | Force delete buffer | Force delete without saving |
| `Alt+hjkl` | Move text | Move lines/blocks in normal/visual mode |
| `af/if` | Function text objects | Around/inside function |
| `ac/ic` | Class text objects | Around/inside class |
| `]f/[f` | Function navigation | Next/previous function |
| `]c/[c` | Class navigation | Next/previous class |

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin versions
├── lua/
│   ├── settings.lua           # Neovim settings
│   ├── keymaps.lua           # Key mappings
│   ├── autocmds.lua          # Auto commands
│   └── plugins/
│       ├── completion.lua     # Blink.cmp setup
│       ├── debugging.lua      # DAP configuration
│       ├── formatting.lua     # Conform.nvim setup
│       ├── git.lua           # Git integration
│       ├── go.lua            # Go language support
│       ├── lsp.lua           # LSP configuration
│       ├── mini.lua          # Mini.nvim modules
│       ├── python.lua        # Python development
│       ├── terminal.lua      # Terminal integration
│       ├── ui.lua            # UI components
│       ├── which-key.lua     # Key helper
│       └── zig.lua           # Zig language support
```

## ⚙️ Configuration Files

### .editorconfig
Place in your project root for consistent formatting across editors:

```ini
# .editorconfig - Universal editor configuration

root = true

# Default settings for all files
[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true

# Programming languages with 2-space indentation
[*.{js,jsx,ts,tsx,json,jsonc,html,css,scss,sass,vue,svelte,xml,yaml,yml,toml}]
indent_style = space
indent_size = 2
max_line_length = 100

# Lua configuration
[*.lua]
indent_style = space
indent_size = 2
max_line_length = 120

# Python configuration
[*.py]
indent_style = space
indent_size = 4
max_line_length = 88

# Go configuration (uses tabs per Go convention)
[*.go]
indent_style = tab
indent_size = 4
max_line_length = 120

# Zig configuration
[*.zig]
indent_style = space
indent_size = 4
max_line_length = 100

# Shell scripts
[*.{sh,bash,zsh}]
indent_style = space
indent_size = 2
max_line_length = 100

# Markdown
[*.md]
indent_style = space
indent_size = 2
trim_trailing_whitespace = false
max_line_length = 80

# Makefiles must use tabs
[{Makefile,makefile,*.mk}]
indent_style = tab
indent_size = 4

# Docker files
[{Dockerfile,*.dockerfile}]
indent_style = space
indent_size = 2
```

### .stylua.toml (Lua)
```toml
column_width = 120
line_endings = "Unix"
indent_type = "Spaces"
indent_width = 2
quote_style = "AutoPreferDouble"
call_parentheses = "Always"
collapse_simple_statement = "Never"
```

### .prettierrc.json (JavaScript/TypeScript/Web)
```json
{
  "semi": true,
  "singleQuote": false,
  "tabWidth": 2,
  "trailingComma": "es5",
  "printWidth": 100,
  "useTabs": false,
  "bracketSpacing": true,
  "arrowParens": "avoid",
  "endOfLine": "lf",
  "overrides": [
    {
      "files": "*.md",
      "options": {
        "printWidth": 80,
        "proseWrap": "always"
      }
    }
  ]
}
```

### pyproject.toml (Python - Ruff)
```toml
[tool.ruff]
line-length = 88
target-version = "py39"
extend-exclude = [
    "__pycache__",
    ".venv",
    "venv",
    ".env",
    "env",
    "migrations",
]

[tool.ruff.lint]
select = [
    "E",   # pycodestyle errors
    "W",   # pycodestyle warnings
    "F",   # pyflakes
    "I",   # isort
    "B",   # flake8-bugbear
    "C4",  # flake8-comprehensions
    "UP",  # pyupgrade
    "N",   # pep8-naming
]
ignore = [
    "E501",  # line too long (handled by formatter)
    "B008",  # do not perform function calls in argument defaults
    "C901",  # too complex
]

[tool.ruff.lint.per-file-ignores]
"__init__.py" = ["F401"]  # allow unused imports in __init__.py
"test_*.py" = ["B011"]    # allow assert False in tests
"**/tests/**/*.py" = ["B011"]

[tool.ruff.lint.isort]
known-first-party = ["your_project_name"]
split-on-trailing-comma = true

[tool.ruff.format]
quote-style = "double"
indent-style = "space"
skip-source-first-line = false
line-ending = "auto"
```

### .sqlfluff (SQL)
```ini
[sqlfluff]
dialect = postgres
templater = jinja
exclude_rules = L003,L011,L012,L014,L016,L031,L034
max_line_length = 100

[sqlfluff:indentation]
tab_space_size = 2
indent_unit = space

[sqlfluff:layout:type:comma]
spacing_before = touch
line_position = trailing

[sqlfluff:rules:capitalisation.keywords]
capitalisation_policy = lower

[sqlfluff:rules:capitalisation.identifiers]
extended_capitalisation_policy = lower
```

## 🚀 Quick Start Workflows

### New Go Project
```bash
mkdir my-go-project && cd my-go-project
go mod init my-go-project
echo 'package main\n\nimport "fmt"\n\nfunc main() {\n    fmt.Println("Hello, World!")\n}' > main.go
nvim main.go
# Use <leader>gr to run!
```

### New Zig Project
```bash
mkdir my-zig-project && cd my-zig-project
zig init-exe
nvim src/main.zig
# Use <leader>zr to run!
```

### New Python Project (UV)
```bash
mkdir my-python-project && cd my-python-project
uv init
uv add --dev pytest ruff mypy
nvim main.py
# Use <leader>pr to run!
```

## 🎨 Customization

### Changing Theme
Edit `lua/plugins/ui.lua`:
```lua
opts = {
  flavour = "macchiato", -- mocha, macchiato, frappe, latte
  -- ... other options
}
```

### Adding New Language
1. Add LSP server to `lua/plugins/lsp.lua`
2. Add formatter to `lua/plugins/formatting.lua`
3. Add Treesitter parser to `lua/plugins/ui.lua`
4. Create language-specific plugin file if needed
5. Add autocmds to `lua/autocmds.lua` for file-specific settings

### Custom Keybindings
Add to `lua/keymaps.lua`:
```lua
map("n", "<leader>custom", "<cmd>YourCommand<CR>", { desc = "Your description" })
```

### Disabling Mini Modules
Edit `lua/plugins/mini.lua` and comment out unwanted modules:
```lua
-- Disable mini.pairs if you don't want auto-pairing
-- {
--   "echasnovski/mini.pairs",
--   ...
-- },
```

## 🔧 Troubleshooting

### Common Issues

### **LSP not working?**
```vim
:checkhealth lsp
:Mason  " Check if servers are installed
:LspInfo " Check LSP status for current buffer
:LspRestart " Restart LSP if needed
```

### **Formatting not working?**
```vim
:ConformInfo " Check formatter status
:Mason " Ensure formatters are installed
```

### **Mini.nvim issues?**
```vim
:checkhealth mini " Check mini.nvim health
" Individual mini modules can be disabled in lua/plugins/mini.lua
```

### **Slow startup?**
```vim
:Lazy profile " Check plugin load times
:checkhealth lazy " Check lazy.nvim health
```

### **Treesitter issues?**
```vim
:TSUpdate " Update parsers
:checkhealth nvim-treesitter
:TSInstallInfo " Check installed parsers
```

### Performance Tips
- Disable unused language servers in Mason
- Reduce Treesitter parsers if not needed: edit `lua/plugins/ui.lua`
- Disable unused mini.nvim modules: edit `lua/plugins/mini.lua`
- Use `:Lazy clean` to remove unused plugins
- Check `:checkhealth` for optimization suggestions
- Monitor startup time with `:Lazy profile`

## 📚 Learning Resources

- **Neovim**: [neovim.io](https://neovim.io)
- **Lazy.nvim**: [lazy.nvim docs](https://lazy.folke.io)
- **Mason**: [mason.nvim](https://github.com/williamboman/mason.nvim)
- **Telescope**: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- **LSP**: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Test your changes thoroughly
4. Submit a pull request

## 📝 License

MIT License - feel free to use and modify as needed.

---

**Happy coding!** 🎉

This configuration is designed to minimize cognitive load while maximizing productivity. The consistent keybinding patterns and zero-config approach mean you can focus on writing code, not configuring your editor.
