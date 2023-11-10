return {
  'OmniSharp/omnisharp-vim',
  lazy = true,
  enabled = true,
  dependencies = {
    'nickspoons/vim-sharpenup',
    {
      'Hoffs/omnisharp-extended-lsp.nvim',
      lazy = true
    }
  },
  -- init = function()
  --   local pid = vim.fn.getpid()
  --   local omnisharp_bin = "/home/peter/omnisharp-linux-x64/run"

  --   local config = {
  --     handlers = {
  --       ["textDocument/definition"] = require('omnisharp_extended').handler,
  --     },
  --     cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
  --     -- rest of your settings
  --     server = {
  --       on_attach = function(_, bufnr)
  --         vim.keymap.set("n", "gD", require('omnisharp_extended').lsp_definitions,
  --           { buffer = bufnr, desc = '[G]oto [D]efinition V2' })
  --       end
  --     },
  --   }

  --   require 'lspconfig'.omnisharp.setup(config)
  -- end,
  config = function()
    vim.g.OmniSharp_server_path = '/home/peter/omnisharp-linux-x64/run'

    vim.g.OmniSharp_diagnostic_exclude_paths = {
      'obj\\',
      '[Tt]emp\\',
      '.nuget\\',
      '<AssemblyInfo.cs>'
    }

    vim.g.OmniSharp_popup_options = {
      highlight = 'Normal',
      border = 'rounded',
      wrap = 'v:true'
    }

    vim.g.OmniSharp_server_use_mono = 0
    vim.g.OmniSharp_server_use_net6 = 1
  end,
  --  ft = "cs"
}
