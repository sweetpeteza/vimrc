-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'christoomey/vim-tmux-navigator',
    --    'xiyaowong/transparent.nvim',
    'gpanders/editorconfig.nvim',
    --    'puremourning/vimspector',
    'c60cb859/bufMov.nvim',
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    -- Lua
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    --   'aquach/vim-http-client',
    { "nvim-neotest/nvim-nio" },
    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim',  opts = {} },
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
    'antoinemadec/FixCursorHold.nvim',

    'dart-lang/dart-vim-plugin',
    'thosakwe/vim-flutter',
    'natebosch/vim-lsc',
    'natebosch/vim-lsc-dart',
    --'ionide/Ionide-vim',
    'vim-test/vim-test',
    'czheo/mojo.vim',
    'jubnzv/virtual-types.nvim'
}
