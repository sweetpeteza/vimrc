return
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
}
