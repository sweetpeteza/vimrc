return {
  'dense-analysis/ale',
  enabled = false,
  config = function()
    vim.g.ale_linters = {
      cs = { 'OmniSharp' }
    }
  end
}
