return {
  "wfxr/minimap.vim",
  enabled = false,
  build = "cargo install --locked code-minimap",
  lazy = false,
  cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
  init = function()
    vim.g.minimap_width = 10
    vim.g.minimap_auto_start = 1
    vim.g.minimap_auto_start_win_enter = 1
  end,
  -- config = function()
  --     vim.cmd("let g:minimap_width = 10")
  --     vim.cmd("let g:minimap_auto_start = 1")
  --     vim.cmd("let g:minimap_auto_start_win_enter = 1")
  -- end,
}
