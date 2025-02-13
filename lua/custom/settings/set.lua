vim.opt.guicursor = "i:block"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "100"

vim.opt.splitbelow = true
vim.opt.splitright = true

--vim.g.netrw_banner = 0
vim.g.netrw_altv = 1
vim.g.netrw_keepdir = 0

--vim.g.transparent_enabled = false
vim.g.wildmenu = 1
vim.g.wildmode = "list:longest,full"

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
-- kickstart


vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('custom_highlights_sonokai', {}),
    pattern = 'sonokai',
    callback = function()
        local config = vim.fn['sonokai#get_configuration']()
        local palette = vim.fn['sonokai#get_palette'](config.style, config.colors_override)
        local set_hl = vim.fn['sonokai#highlight']

        set_hl('WinSeparator', palette.green, palette.none)
    end
})

vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1


--vim.cmd.colorscheme "catppuccin-mocha"

--vim.g.aurora_italic = 1      -- italic
--vim.g.aurora_transparent = 1 -- transparent
--vim.g.aurora_bold = 1        -- bold
--vim.g.aurora_darker = 1      -- darker backgroundim.g.aurora_italic = 1

--vim.cmd.colorscheme "srcery"
--vim.cmd.colorscheme "solarized-osaka"
--vim.cmd.colorscheme "embark"
--vim.cmd.colorscheme "onedark"
vim.cmd.colorscheme "sonokai"

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--


-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- /kickstart

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
    set signcolumn=yes
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.g.minimap_width = 10
vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1

--vim.cmd([[
--    augroup fmt
--      autocmd!
--      autocmd BufWritePre * undojoin | Neoformat
--    augroup END
--]])
--
--
vim.opt.conceallevel = 0
