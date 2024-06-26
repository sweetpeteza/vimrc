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
  config = function()
    --vim.g.OmniSharp_server_path = '/home/peter/omnisharp/OmniSharp' --'/home/me/omnisharp/omnisharp.http-linux-x64/run'
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
    vim.g.OmniSharp_popup = 0

    vim.g.OmniSharp_timeout = 5
  end,
  --  ft = "cs"
}
