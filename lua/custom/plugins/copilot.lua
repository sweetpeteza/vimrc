return {
  'github/copilot.vim',
  enabled = true,
  config = function()
    --require('copilot').setup({
    --    suggestion = { enabled = false },
    --    panel = { enabled = false },
    --})

    vim.g.copilot_filetypes = {
      ["*"] = false,
      ["javascript"] = true,
      ["typescript"] = true,
      ["typescriptreact"] = true,
      ["lua"] = false,
      ["rust"] = true,
      ["c"] = true,
      ["c#"] = true,
      ["cs"] = true,
      ["c++"] = true,
      ["go"] = true,
      ["python"] = true,
    }

    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end
}
