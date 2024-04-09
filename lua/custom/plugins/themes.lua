return {
    { 'ray-x/aurora' },
    { 'joshdick/onedark.vim' },
    { 'sainnhe/sonokai' },
    { 'tanvirtin/monokai.nvim' },
    { 'embark-theme/vim' },
    { 'olimorris/onedarkpro.nvim' },
    { 'morhetz/gruvbox' },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false
        },
    },
    {
        'srcery-colors/srcery-vim',
        config = function()
            vim.g.srcery_italic = 1
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            integrations = {
                alpha = true,
                cmp = true,
                gitsigns = true,
                harpoon = true,
                nvimtree = true,
                telescope = {
                    enabled = true,
                    -- style = "nvchad"
                },
                lsp_trouble = true,
                treesitter = true,
                notify = true,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
            }
        }
    }
}
