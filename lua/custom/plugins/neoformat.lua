return {
  'sbdchd/neoformat',
  config = function()
    vim.g.neoformat_sql_sleek = {
      exe = "sleek"
    }

    vim.g.neoformat_enabled_sql = { "sleek" }
  end
}

