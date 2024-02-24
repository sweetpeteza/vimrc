-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)
return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',

  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    require('nvim-dap-virtual-text').setup()

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    --    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    --    vim.keymap.set('n', '<F10>', dap.step_into, { desc = 'Debug: Step Into' })
    --    vim.keymap.set('n', '<F11>', dap.step_over, { desc = 'Debug: Step Over' })
    --    vim.keymap.set('n', '<F9>', dap.step_out, { desc = 'Debug: Step Out' })
    --    vim.keymap.set('n', '<F17>', dap.terminate, { desc = 'Debug: Stop' })
    --    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    --    vim.keymap.set('n', '<leader>B', function()
    --      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    --    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        enabled = false,
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    -- CSHARP
    --    dap.adapters.coreclr = {
    --      type = 'executable',
    --      command = '/usr/local/netcoredbg',
    --      args = { '--interpreter=vscode', "--engineLogging=dap_log.txt" }
    --    }

    --    vim.g.dotnet_build_project = function()
    --      local default_path = vim.fn.getcwd() .. "/"
    --      if vim.g["dotnet_last_proj_path"] ~= nil then
    --        default_path = vim.g["dotnet_last_proj_path"]
    --      end
    --      local path = vim.fn.input({ prompt = "Path to your *proj file: ", default = default_path, completion = "file" })
    --      vim.g["dotnet_last_proj_path"] = path
    --      local cmd = 'dotnet build -c Debug "' .. path .. '"'
    --      print("\n")
    --      print("Cmd to execute: " .. cmd)
    --      local f = os.execute(cmd)
    --      if f == 0 then
    --        print("\nBuild: OK")
    --      else
    --        print("\nBuild: ERR: " .. f)
    --      end
    --    end
    --
    --    vim.g.dotnet_get_dll_path = function()
    --      local request = function()
    --        return vim.fn.input({
    --          prompt = "Path to dll: ",
    --          default = vim.fn.getcwd() .. "/bin/Debug/",
    --          completion = "file",
    --        })
    --      end
    --
    --      if vim.g["dotnet_last_dll_path"] == nil then
    --        vim.g["dotnet_last_dll_path"] = request()
    --      else
    --        if
    --            vim.fn.confirm("Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"], "&yes\n&no", 2)
    --            == 1
    --        then
    --          vim.g["dotnet_last_dll_path"] = request()
    --        end
    --      end
    --      return vim.g["dotnet_last_dll_path"]
    --    end
    --    local launch_json = vim.fn.getcwd() .. "/.nvim/env.json"
    --    local readAll = function(file)
    --      local f = assert(io.open(file, "rb"))
    --      local content = f:read("*all")
    --      f:close()
    --      return content
    --    end
    --
    --    local load_json = function()
    --      return vim.json.decode(readAll(launch_json))
    --    end
    --    vim.g.dotnet_get_env = function()
    --      if vim.g["dotnet_env_vars"] == nil then
    --        vim.g["dotnet_env_vars"] = load_json()
    --      end
    --      return vim.g["dotnet_env_vars"]
    --    end
    --
    --    local config = {
    --      {
    --        type = "coreclr",
    --        name = "launch - netcoredbg",
    --        request = "launch",
    --        console = "integratedTerminal",
    --        env = vim.g.dotnet_get_env,
    --        program = function()
    --          if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
    --            vim.g.dotnet_build_project()
    --          end
    --          local dll = vim.g.dotnet_get_dll_path()
    --          return dll
    --        end,
    --      },
    --      {
    --        type = "coreclr",
    --        name = "attach",
    --        request = "attach",
    --        console = "integratedTerminal",
    --        env = vim.g.dotnet_get_env,
    --        processId = function()
    --          return vim.fn.input('Process Id:')
    --        end,
    --        program = function()
    --          return '/home/peter/playbk/pbk-api-core/Pbk.Api/bin/Debug/net6.0/Pbk.Api.dll'
    --        end
    --      }
    --    }
    --
    --    dap.configurations.cs = config

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- Install golang specific config
    require('dap-go').setup()
  end,
}
