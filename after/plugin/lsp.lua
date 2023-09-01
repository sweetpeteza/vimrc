local lsp = require('lsp-zero')
 require('lspconfig').sqlls.setup{
        on_attach = function(client, bufnr)
            require('sqlls').on_attach(client, bufnr)
        end
    }
lsp.preset('recommended')

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers(
    {
        'tsserver',
        'eslint',
        'omnisharp',
        'sqlls',
        'rustanalyzer'
    })
-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


lsp.setup()
