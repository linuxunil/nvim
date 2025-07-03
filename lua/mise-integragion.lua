-- lua/mise-integration.lua (Optional: Enhanced mise integration)

local M = {}

-- Check if mise is available
local function has_mise()
  return vim.fn.executable('mise') == 1
end

-- Get mise-managed tool path
local function get_tool_path(tool)
  if not has_mise() then return nil end

  local handle = io.popen('mise which ' .. tool .. ' 2>/dev/null')
  if not handle then return nil end

  local result = handle:read('*a')
  handle:close()

  if result and result ~= '' then
    return vim.trim(result)
  end
  return nil
end

-- Setup LSP with mise-managed tools
function M.setup_lsp_paths()
  -- Go tools
  local gopls_path = get_tool_path('gopls')
  if gopls_path then
    vim.g.go_gopls_path = gopls_path
  end

  -- Python tools
  local python_path = get_tool_path('python')
  if python_path then
    vim.g.python3_host_prog = python_path
  end

  -- Update PATH for LSP servers
  if has_mise() then
    local mise_path = vim.fn.system('mise env --shell=bash | grep "^export PATH" | cut -d= -f2- | tr -d \'"\'')
    if mise_path and mise_path ~= '' then
      vim.env.PATH = vim.trim(mise_path)
    end
  end
end

-- Auto-activate mise on directory change
function M.setup_auto_activation()
  vim.api.nvim_create_autocmd({ 'DirChanged', 'VimEnter' }, {
    callback = function()
      if has_mise() then
        -- Refresh environment when changing directories
        local handle = io.popen('mise env --shell=bash 2>/dev/null')
        if handle then
          local env_output = handle:read('*a')
          handle:close()

          -- Parse and apply environment variables
          for line in env_output:gmatch('[^\r\n]+') do
            local var, value = line:match('^export ([^=]+)=(.+)$')
            if var and value then
              -- Remove quotes and apply
              value = value:gsub('^"', ''):gsub('"$', '')
              vim.env[var] = value
            end
          end
        end
      end
    end,
  })
end

-- Show current mise environment info
function M.show_info()
  if not has_mise() then
    print("Mise not found")
    return
  end

  print("=== Mise Environment ===")

  -- Show active tools
  local tools = vim.fn.system('mise list --current 2>/dev/null')
  if tools and tools ~= '' then
    print("Active tools:")
    print(tools)
  end

  -- Show project tasks
  local tasks = vim.fn.system('mise tasks 2>/dev/null')
  if tasks and tasks ~= '' then
    print("Available tasks:")
    print(tasks)
  end
end

-- Run mise task
function M.run_task(task)
  if not has_mise() then
    print("Mise not found")
    return
  end

  local cmd = 'mise run ' .. (task or '')
  vim.cmd('terminal ' .. cmd)
end

return M
