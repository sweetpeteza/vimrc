
-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
--map("n", "<Leader>", ":<C-u>WhichKey ','<CR>" { silent = true })
--map("n", "<Leader>?", ":WhichKey ','<CR>", { silent = true })
--map("n", "<Leader>a", ":cclose<CR>", { silent = true })




map("n", "gd", "<Plug>(omnisharp_go_to_definition)", { silent = true })
map("n",  "<Leader>fu", "<Plug>(omnisharp_find_usages)", { silent = true })
map("n",  "<Leader>fi", "<Plug>(omnisharp_find_implementations)", { silent = true })
map("n",  "<Leader>pd", "<Plug>(omnisharp_preview_definition)", { silent = true })
map("n",  "<Leader>pi", "<Plug>(omnisharp_preview_implementations)", { silent = true })
map("n",  "<Leader>t", "<Plug>(omnisharp_type_lookup)", { silent = true })
map("n",  "<Leader>d", "<Plug>(omnisharp_documentation)", { silent = true })
map("n",  "<Leader>fs", "<Plug>(omnisharp_find_symbol)", { silent = true })
map("n",  "<Leader>fx", "<Plug>(omnisharp_fix_usings)", { silent = true })
map("n",  "<C-\\>", "<Plug>(omnisharp_signature_help)", { silent = true })
map("i",  "<C-\\>", "<Plug>(omnisharp_signature_help)", { silent = true })

  -- Find all code errors/warnings for the current solution and populate the quickfix window
map("n",  "<Leader>gcc", "<Plug>(omnisharp_global_code_check)", { silent = true })
  -- Contextual code actions ~uses fzf, vim-clap, CtrlP or unite.vim selector when available~
map("n",  "<Leader>ca", "<Plug>(omnisharp_code_actions)", { silent = true })
map("x",  "<Leader>ca", "<Plug>(omnisharp_code_actions)", { silent = true })
  -- Repeat the last code action performed ~does not use a selector~
map("n",  "<Leader>.", "<Plug>(omnisharp_code_action_repeat)", { silent = true })
map("x",  "<Leader>.", "<Plug>(omnisharp_code_action_repeat)", { silent = true })

map("n",  "<Leader>=", "<Plug>(omnisharp_code_format)", { silent = true })
map("n",  "<Leader>nm", "<Plug>(omnisharp_rename)", { silent = true })

map("n",  "<Leader>re", "<Plug>(omnisharp_restart_server)", { silent = true })
map("n",  "<Leader>st", "<Plug>(omnisharp_start_server)", { silent = true })
map("n",  "<Leader>sp", "<Plug>(omnisharp_stop_server)", { silent = true })

  -- CursorHold *.cs OmniSharpTypeLookup
