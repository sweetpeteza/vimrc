return {
  'OmniSharp/omnisharp-vim',
  lazy = true,
  config = function()
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

    vim.g.OmniSharp_selector_findusages = 'fzf'
  end,
  ft = "cs"
}