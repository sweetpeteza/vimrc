return {
  'sbdchd/neoformat',
  config = function()
    vim.g.neoformat_sql_sleek = {
      exe = "sleek"
    }

    vim.g.neoformat_enabled_sql = { "sleek" }
    --vim.g.neoformat_enabled_python = { 'black', 'docformatter' }
    vim.g.neoformat_enabled_cs = { "csharpier" }
    vim.g.neoformat_enabled_typescript = { "prettier" }
    vim.g.neoformat_enabled_typescriptreact = { "prettier" }
  end
}
