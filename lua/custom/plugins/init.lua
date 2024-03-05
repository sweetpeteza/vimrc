-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'christoomey/vim-tmux-navigator',
    'tanvirtin/monokai.nvim',
    'xiyaowong/transparent.nvim',
    'gpanders/editorconfig.nvim',
    'sbdchd/neoformat',
    --    'puremourning/vimspector',
    'c60cb859/bufMov.nvim',
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    -- Lua
    {
        "0oAstro/dim.lua",
        dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
    },
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "ldelossa/gh.nvim",
        dependencies = {
            {
                "ldelossa/litee.nvim",
                config = function()
                    require("litee.lib").setup()
                end,
            },
        },
        config = function()
            require("litee.gh").setup()
        end,
    },
    {
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
        config = function()
            require("silicon").setup({
                -- Configuration here, or leave empty to use defaults
                font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
                theme = "Dracula",
                background = "#94e2d5",
                to_clipboard = true,
                output = function()
                    return "/home/peter/Pictures/Silicon" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
                end,
                command = "silicon",
                -- a string or function returning a string that defines the title showing in the image
                -- only works in silicon versions greater than v0.5.1
                window_title = function()
                    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
                end,
                language = function()
                    return vim.bo.filetype
                end,
                no_line_number = true,

            })
        end
    },
    'aquach/vim-http-client',
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        'echasnovski/mini.nvim',
        version = false,
        init = function()
            require('mini.pairs').setup()
        end
    },
    {
        'simrat39/rust-tools.nvim',
        init = function()
            local rt = require("rust-tools")

            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        -- Hover actions
                        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                },
            })
        end
    },
    {
        'ldelossa/gh.nvim',
        dependencies = { 'ldelossa/litee.nvim' },
    },
    {
        'filipdutescu/renamer.nvim',
        branch = 'master',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = true,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview git hunk' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
            end,
        },
    },
    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim', opts = {} },
    {
        'tpope/vim-dadbod',
        lazy = true,
        dependencies = {
            'kristijanhusak/vim-dadbod-ui',
            'kristijanhusak/vim-dadbod-completion',
        },
        cmd = {
            'DBUIToggle',
            'DBUI',
            'DBUIAddConnection',
            'DBUIFindBuffer',
            'DBUIRenameBuffer',
            'DBUILastQueryInfo'
        },
    },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    { 'joshdick/onedark.vim' },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        enabled = true,
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        main    = "ibl",
        opts    = {},
    },
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
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
    },
    { 'ray-x/aurora' },
    { 'sainnhe/sonokai' },
    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        config = function()
            require("telescope").load_extension("ui-select")
        end
    },
    -- another fuzzy finder
    {
        'liuchengxu/vim-clap',
        build = ':Clap install-binary'
    },
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    {
        "rcarriga/nvim-notify",
        init = function()
            vim.opt.termguicolors = true
            require('notify').setup({
                background_colour = "#000000"
            })
            vim.notify = require("notify")
        end
    },
    {
        'mrded/nvim-lsp-notify',
        dependencies = {
            'rcarriga/nvim-notify'
        },
        config = function()
            require('lsp-notify').setup({})
        end
    },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        enabled = true,
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        { -- This plugin
            "Zeioth/compiler.nvim",
            cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
            dependencies = { "stevearc/overseer.nvim" },
            opts = {},
        },
        { -- The task runner we use
            "stevearc/overseer.nvim",
            commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
            cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
            opts = {
                task_list = {
                    direction = "bottom",
                    min_height = 25,
                    max_height = 25,
                    default_detail = 1
                },
            },
        },
    },
    -- Lazy
    {
        'dgagn/diagflow.nvim',
        opts = {
            enable = function()
                return vim.bo.filetype ~= "lazy"
            end,
            format = function(diagnostic)
                return diagnostic.message
            end,
            scope = "line",
            placement = "top",
            text_align = "right",
            show_sign = true,
            padding_right = 1,
            gap = 3,
            update_event = { 'DiagnosticChanged', 'BufReadPost' }, -- the event that updates the diagnostics cache
            toggle_event = { "InsertEnter" },
            render_event = { 'DiagnosticChanged', 'CursorMoved' },
            max_width = 60,     -- The maximum width of the diagnostic messages
            max_height = 10,    -- the maximum height per diagnostics
            severity_colors = { -- The highlight groups to use for each diagnostic severity level
                error = "DiagnosticFloatingError",
                warning = "DiagnosticFloatingWarn",
                info = "DiagnosticFloatingInfo",
                hint = "DiagnosticFloatingHint",
            },
        },
    }
}
