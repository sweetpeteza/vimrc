return {
  'dense-analysis/ale',
  config = function()
    vim.g.ale_linters = {
      cs = { 'OmniSharp' }
    }
  end
}
