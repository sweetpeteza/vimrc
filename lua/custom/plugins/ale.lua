return {
  'dense-analysis/ale',
  enabled = true,
  config = function()
    vim.g.ale_linters = {
      cs = { 'OmniSharp' }
    }
  end
}
